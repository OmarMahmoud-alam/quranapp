import 'package:injectable/injectable.dart';
import 'package:quranapp/features/suarh/domain/repositories/fetch_quran_repository.dart';
@lazySingleton
class FetchSurahAndAyahsUseCase {
  final FetchQuranRepository repository;

  FetchSurahAndAyahsUseCase(this.repository);

  Future<Map<String, dynamic>> call(int surahNumber) async {
    final surahName = await repository.fetchSurahName(surahNumber);
    final ayahs = await repository.fetchAyahsBySurahNumber(surahNumber);

    return {
      'surahName': surahName,
      'ayahs': ayahs,
    };
  }
}