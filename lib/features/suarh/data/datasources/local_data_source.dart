import 'dart:collection';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/core/data/data_sources/local_data_source.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/quran_page.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/domain/entities/surahs_page_data.dart';


@lazySingleton
class LocalDataSourceFetchSarah {
    final LocalDataSource dataSource;
  LocalDataSourceFetchSarah(this.dataSource);
  late Isar _isarInstance;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    log('initializing isar');
    _isarInstance = dataSource.isarInstance;
  }


  // Fetch Surah name by number
  Future<String?> getSurahNameByNumber(int surahNumber) async {
    final surah = await _isarInstance.surahs.get(surahNumber);
    return surah?.name;
  }

  // Fetch Ayahs of a specific Surah by Surah number
  Future<List<Ayah>> getAyahsBySurahNumber(int surahNumber) async {
    return await _isarInstance.ayahs.filter().surahNumberEqualTo(surahNumber).findAll();
  }

  Future<List<Map<int, List<Ayah>>>> getSurahAyahTextGroupedByPages(int surahNumber) async {
  final isar = _isarInstance;
final allPages = await isar.quranPages.where().findAll();
for (var e in allPages){
  var temp=e.surahPageData.length;
log ('om${e.pagenumber}+${temp}');
}
  // Fetch all Quran pages with their linked SurahPageData
  final quranPages = await isar.quranPages.where().filter().surahPageData(
        (quranPage) => quranPage.surahEqualTo(surahNumber),
      )
  .findAll();/*  */
  log("quranPages:${quranPages.length}");

  // Initialize a list to hold the Ayah text grouped by pages
  final List<Map<int, List<Ayah>>> pagesWithAyahs = [];

  for (var quranPage in quranPages) {
final ayahTextBySurah = LinkedHashMap<int, List<Ayah>>();

    for (var surahPageData in quranPage.surahPageData) {
      final ayahTexts = await isar.ayahs
          .where()
          .filter()
          .surahNumberEqualTo(surahNumber)
          .and()
          .numberBetween(surahPageData.start, surahPageData.end)
          .findAll();

      // Collect the Ayah texts for the current Surah
      ayahTextBySurah[quranPage.pagenumber] = ayahTexts;
    }

    // Add the Surah-Ayah mapping to the list
    pagesWithAyahs.add(ayahTextBySurah);
  }
  log("LKL:${pagesWithAyahs.length}");
  return pagesWithAyahs;
}
Future<List<Map<String, List<Ayah>>>> getAyahsByPageNumber(int pageNumber) async {
  // Fetch the Quran page corresponding to the given page number
  final quranPage = await _isarInstance.quranPages
      .filter()
      .pagenumberEqualTo(pageNumber)
      .findFirst();

  if (quranPage == null) {
    // Return an empty list if the page number is not found
    return [];
  }

  // Initialize a list to hold the Ayahs and Surah names on this page
  final List<Map<String, List<Ayah>>> ayahsOnPageWithSurahNames = [];

  for (var surahPageData in quranPage.surahPageData) {
    // Fetch the Ayahs in the range of the Surah page data
    final ayahs = await _isarInstance.ayahs
        .filter()
        .surahNumberEqualTo(surahPageData.surah)
        .and()
        .numberBetween(surahPageData.start, surahPageData.end)
        .findAll();

    // Fetch the Surah name using the Surah number
    final surah = await _isarInstance.surahs.get(surahPageData.surah);
    final surahName = surah?.name ?? 'Unknown Surah';

    // Add the Surah name and Ayahs to the list
    ayahsOnPageWithSurahNames.add({
      surahName: ayahs,
    });
  }

  return ayahsOnPageWithSurahNames;
}
}
