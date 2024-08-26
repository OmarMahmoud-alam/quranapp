import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:quran/page_data.dart';
import 'package:quranapp/core/data/data_sources/local_data_source.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/quran_page.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/domain/entities/surahs_page_data.dart';
import 'package:quranapp/features/home/domain/repositories/quran_repository.dart';
import 'package:quran/quran.dart' as quran;

@LazySingleton(as: QuranRepository)
class QuranRepositoryImpl implements QuranRepository {
  final LocalDataSource localDataSource;

  const QuranRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveQuranData() async {
    final isar = localDataSource.isarInstance;

    // Check if data already exists
    if (await _isDatabaseNotEmpty(isar)) return;

    await _saveQuranPages(isar);
    await _saveSurahsAndAyahs(isar);
  }

  Future<bool> _isDatabaseNotEmpty(Isar isar) async {
    final surahCount = await isar.surahs.count();
    return surahCount > 0;
  }


Future<void> _saveQuranPages(Isar isar) async {
    await isar.writeTxn(() async {

  final List<QuranPage> quranPages = [];

    for (int i = 0; i < 604; i++) {
      // Generate SurahPageData for this page
      final surahPageDataList = _generateQuranPages(i);

      // Save SurahPageData first
      await isar.surahPageDatas.putAll(surahPageDataList);

      // Create QuranPage and link the SurahPageData
      final quranPage = QuranPage(pagenumber: i + 1);
      quranPage.surahPageData.addAll(surahPageDataList);

      // Add QuranPage to the list
      quranPages.add(quranPage);
    }

    // Save all QuranPages with their linked SurahPageData
    await isar.quranPages.putAll(quranPages);
    for (var quranPage in quranPages) {
      await quranPage.surahPageData.save();
    }
  });

  //log((await isar.quranPages.count()).toString());
}

List<QuranPage> _generateQuranPages2(isar ) {
  List<QuranPage> quranPage = [];

  for (int i = 0; i < 604; i++) {
    List<SurahPageData> surahPageDataList = pageData[i].map<SurahPageData>((data) {
      return SurahPageData(
        surah: data['surah'],
        start: data['start'],
        end: data['end'],
      );
    }).toList();
    var quranPageItem = QuranPage(pagenumber: i + 1);
    quranPageItem.surahPageData.addAll(surahPageDataList);

    quranPage.add(quranPageItem);
  }

  return quranPage;
}

List<SurahPageData> _generateQuranPages(int index) {
  // Assuming pageData is available and structured properly
  return pageData[index].map<SurahPageData>((data) {
    return SurahPageData(
      surah: data['surah'],
      start: data['start'],
      end: data['end'],
    );
  }).toList();
}








/*
  Future<void> _saveQuranPages(Isar isar) async {
    final quranPages = _generateQuranPages();
    await isar.writeTxn(() async {
      await isar.quranPages.putAll(quranPages);

    });
log((await isar.quranPages.count()).toString());

  }

  List<QuranPage> _generateQuranPages() {
     List<QuranPage >quranPage=[] ;
for(int i=0;i<604;i++){
   List<SurahPageData> surahPageDataList=pageData[i].map<SurahPageData>((data) {
        return SurahPageData(
          surah: data['surah'],
          start: data['start'],
          end: data['end'],
        );
      }).toList();
      log(surahPageDataList[0].toString());
    quranPage.add( QuranPage(pagenumber: i + 1)
        ..surahPageData.addAll(surahPageDataList));
}
  

return quranPage;
   
  }
*/
  Future<void> _saveSurahsAndAyahs(Isar isar) async {
    final surahList = <Surah>[];
    final ayahList = <Ayah>[];

    for (int i = 1; i <= quran.totalSurahCount; i++) {
      surahList.add(Surah()
        ..number = i
        ..name = quran.getSurahNameArabic(i)
        ..ayahCount = quran.getVerseCount(i));

      ayahList.addAll(_generateAyahsForSurah(i));
    }

    await isar.writeTxn(() async {
      await isar.surahs.putAll(surahList);
      await isar.ayahs.putAll(ayahList);
    });
  }

  List<Ayah> _generateAyahsForSurah(int surahNumber) {
    return List.generate(quran.getVerseCount(surahNumber), (j) {
      return Ayah()
        ..number = j + 1
        ..surahNumber = surahNumber
        ..text = quran.getVerse(surahNumber, j + 1);
    });
  }

  @override
  Future<bool> hasQuranData() async {
    final isar = localDataSource.isarInstance;
    return await _isDatabaseNotEmpty(isar);
  }

  @override
  Future<List<Surah>> getsurahsdata() async {
    final isar = localDataSource.isarInstance;
    return await isar.surahs.where().findAll();
  }
}
