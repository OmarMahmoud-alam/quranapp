import 'package:isar/isar.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import '../../domain/repositories/quran_repository.dart';

abstract class  QuranRepository {

  QuranRepository();

  Future<void> saveQuranData() async {
    // Fetch and save Quran data as before
  }

  Future hasQuranData() async {}
}