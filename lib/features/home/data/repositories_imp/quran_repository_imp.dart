import 'package:injectable/injectable.dart';
import 'package:quranapp/core/data/data_sources/local_data_source.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/domain/repositories/quran_repository.dart';
import 'package:quran/quran.dart'as quran;


@LazySingleton(as: QuranRepository)  
class QuranRepositoryImpl implements QuranRepository {
  final LocalDataSource localDataSource;

 const  QuranRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveQuranData() async {
    final isar = localDataSource.isarInstance;
     final surahCount = await isar.surahs.count();
    if (surahCount > 0) {
      // Database is not empty
      return;
    }

    final surahList = <Surah>[];
    for (int i = 1; i <= quran.totalSurahCount; i++) {
      final surah = Surah()
        ..number = i
        ..name = quran.getSurahName(i)
        ..ayahCount = quran.getVerseCount(i);

      surahList.add(surah);

      final ayahList = <Ayah>[];

      for (int j = 1; j <= quran.getVerseCount(i); j++) {
        final ayah = Ayah()
          ..number = j
          ..surahNumber = i
          ..text = quran.getVerse(i, j);

        ayahList.add(ayah);
      }
    await isar.writeTxn(() async {
      await isar.surahs.putAll(surahList);
      await isar.ayahs.putAll(ayahList);
    });

  }
   print(await isar.surahs.count());
 print(await isar.ayahs.count());}

  @override
  Future<bool> hasQuranData() async {
    final isar = localDataSource.isarInstance;
    final surahCount = await isar.surahs.count();
    return surahCount > 0;
  }



}