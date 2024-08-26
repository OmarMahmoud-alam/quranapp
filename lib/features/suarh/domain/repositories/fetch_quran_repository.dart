import 'package:quranapp/features/home/domain/entities/ayah.dart';

abstract class FetchQuranRepository {
  Future<String?> fetchSurahName(int surahNumber);
  Future<List<Ayah>> fetchAyahsBySurahNumber(int surahNumber);
  Future<List<Map<int, List<Ayah>>>> fetchSurahAyahsSurahbypage(int surahNumber);
  Future<List<Map<String, List<Ayah>>>> fetchAyahsByPage(int pageNumber);

}