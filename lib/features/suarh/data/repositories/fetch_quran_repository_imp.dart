import 'package:injectable/injectable.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/data/datasources/local_data_source.dart';

import 'package:quranapp/features/suarh/domain/repositories/fetch_quran_repository.dart';
@LazySingleton(as:FetchQuranRepository )
class FetchQuranRepositoryImpl implements FetchQuranRepository {
  final LocalDataSourceFetchSarah localDataSource;

  FetchQuranRepositoryImpl(this.localDataSource);

  @override
  Future<String?> fetchSurahName(int surahNumber) async {
    return await localDataSource.getSurahNameByNumber(surahNumber);
  }

  @override
  Future<List<Ayah>> fetchAyahsBySurahNumber(int surahNumber) async {
    return await localDataSource.getAyahsBySurahNumber(surahNumber);
  }
}