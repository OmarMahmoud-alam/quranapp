import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quranapp/core/configs/strings.dart';
import 'package:quranapp/core/resources/textstyles.dart';
import 'package:quranapp/core/utils/extension_methods.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';

class MergedAyahTextSpan extends StatelessWidget {
  final List<Ayah> ayahs;
  final int pageNumber;
  double _getYOffsetOf(GlobalKey key) {
    final box = key.currentContext!.findRenderObject() as RenderBox;

    return box.localToGlobal(Offset.zero).dy;
  }

  double _getXOffsetOf(GlobalKey key) {
    final box = key.currentContext!.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero).dx;
  }

  void _resolveSameRow(List<GlobalKey<_WidgetSpanWrapperState>> keys) {
    var middle = (keys.length / 2.0).floor();
    for (int i = 0; i < middle; i++) {
      var a = keys[i];
      var b = keys[keys.length - i - 1];
      var left = _getXOffsetOf(a);
      var right = _getXOffsetOf(b);
      a.currentState!.updateXOffset(right - left);
      b.currentState!.updateXOffset(left - right);
    }
  }

  const MergedAyahTextSpan({super.key, required this.ayahs, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    final keys = <GlobalKey<_WidgetSpanWrapperState>>[];
    nextKey() {
      var key = GlobalKey<_WidgetSpanWrapperState>();
      keys.add(key);
      return key;
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      List<GlobalKey<_WidgetSpanWrapperState>>? sameRow;
      GlobalKey<_WidgetSpanWrapperState> prev = keys.removeAt(0);
      for (var key in keys) {
        if (_getYOffsetOf(key) == _getYOffsetOf(prev)) {
          sameRow ??= [prev];
          sameRow.add(key);
        } else if (sameRow != null) {
          _resolveSameRow(sameRow);
          sameRow = null;
        }
        prev = key;
      }
      if (sameRow != null) {
        _resolveSameRow(sameRow);
      }
    });
    return Column(
      children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: RichText(
          
          text: TextSpan(
             style: normalbodyBlack.copyWith(fontFamily:'Uthmanic',fontSize:20 ,),
            children: [
              for (var ayah in ayahs) ...[
                _buildAyahTextSpan(ayah),
                _buildAyahNumberSpan(
                  ayah,
                  nextKey(),
                ),
              ]
            ],
          ),
        ),
      ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(pageNumber.toString()),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextSpan _buildAyahTextSpan(Ayah ayah) {
    return TextSpan(text: '${ayah.text} ',);
  }

  WidgetSpan _buildAyahNumberSpan(Ayah ayah, key) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: WidgetSpanWrapper(
        key: key,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Stack(
              children: [
                Image.asset(
                  'assets/image/ayah.png',
                  width: 30,
                  height: 30,
                ),
                Align(
                  child: Text(ayah.number.intToArabic,style: const TextStyle(fontFamily:Strings.fontFamilyofayah ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetSpanWrapper extends StatefulWidget {
  const WidgetSpanWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<WidgetSpanWrapper> createState() => _WidgetSpanWrapperState();
}

class _WidgetSpanWrapperState extends State<WidgetSpanWrapper> {
  Offset offset = Offset.zero;

  void updateXOffset(double xOffset) {
    setState(() {
      offset = Offset(xOffset, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: widget.child,
    );
  }
}
