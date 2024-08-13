import 'package:injectable/injectable.dart';
import 'package:quranapp/features/home/domain/repositories/quran_repository.dart';
@LazySingleton()
class SaveQuranDataIfEmpty {
  final QuranRepository repository;

  SaveQuranDataIfEmpty(this.repository);

  Future<void> call() async {
    // Check if Surah collection is empty
    final hasData = await repository.hasQuranData();
    print("rr"+hasData.toString());
    if (!hasData) {
      // Save Quran data if the collection is empty
      await repository.saveQuranData();
    }
  }
}