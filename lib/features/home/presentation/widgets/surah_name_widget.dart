import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/presentation/pages/home.dart';

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({
    super.key, required this.surah,
  });
final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical:5),

      child: Row(
        children: [
         SizedBox(
           width: 25,
           height: 25,
            child: Stack(
              children: [
                Image.asset('assets/image/ayah.png',width: 25,height: 25,fit: BoxFit.cover,),
                Align(
          
                  child: Text(
                    '${surah.number}',
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(surah.name),
              Text(translateToArabic(quran.getPlaceOfRevelation(surah.number))),
              
            ],
          ),
          const Spacer(),
          
              Text('اية${quran.getVerseCount(surah.number).toString()}' ),
          
        ],
      ),
    );
  }
}