import 'package:quranapp/features/home/domain/entities/ayah.dart';

abstract class FetchQuranRepository {
  Future<String?> fetchSurahName(int surahNumber);
  Future<List<Ayah>> fetchAyahsBySurahNumber(int surahNumber);
}