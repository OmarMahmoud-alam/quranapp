import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';

part 'suarh_state.dart';

class SuarhCubit extends Cubit<SuarhState> {
   final FetchSurahAndAyahsUseCase fetchSurahAndAyahsUseCase;
 TextSpan?  mergedTextSpan;
  SuarhCubit(this.fetchSurahAndAyahsUseCase) : super(SuarhInitial());

  Future<void> fetchSurahAndAyahs(int surahNumber) async {
    try {
      emit(QuranLoading());
      final result = await fetchSurahAndAyahsUseCase(surahNumber);
             mergedTextSpan = _mergeAyahsIntoTextSpan(result['ayahs']);

      emit(FetchSurahSucess());
    } catch (e) {
      emit(FetchSurahError("Failed to load Surah and Ayahs"));
    }
  }
  TextSpan _mergeAyahsIntoTextSpan(List<Ayah> ayahs) {

    for(var aya in ayahs){
      log(aya.toString());
    }
    return TextSpan(
      children: ayahs.map((ayah) {
     
        return     TextSpan(
          
        children:<InlineSpan> [
          TextSpan(
            text: '${ayah.text} ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            children:<InlineSpan> [ WidgetSpan(
            alignment:PlaceholderAlignment.top,
            child: Container(
           //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
             margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(5),
                color: Colors.green[50], // Optional background color
              ),
              child: Text(
                '${ayah.number}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),]
          ),
          
         
       // Adding space after the number
       ],
      );
    }).toList(),
    );
  }
}
class CustomBackgroundPainter extends CustomPainter {
  final ImageProvider backgroundImage;

  CustomBackgroundPainter(this.backgroundImage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final image = AssetImage('assets/background.png'); // Your background image asset

    image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((imageInfo, synchronousCall) {
        final img = imageInfo.image;
        final imageSize = Size(img.width.toDouble(), img.height.toDouble());
        final srcRect = Rect.fromLTWH(0, 0, imageSize.width, imageSize.height);
        final dstRect = Rect.fromLTWH(0, 0, size.width, size.height);
        paint.shader = ImageShader(img, TileMode.repeated, TileMode.repeated, Matrix4.identity().storage);
        canvas.drawRect(dstRect, paint);
      }),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}