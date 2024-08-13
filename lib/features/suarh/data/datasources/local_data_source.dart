import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/core/data/data_sources/local_data_source.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';


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
}
