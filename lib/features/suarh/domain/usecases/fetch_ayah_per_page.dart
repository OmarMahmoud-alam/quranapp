import 'package:injectable/injectable.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/domain/repositories/fetch_quran_repository.dart';

@lazySingleton
class FetchAyahsPageUseCase {
  final FetchQuranRepository repository;

  FetchAyahsPageUseCase(this.repository);

  Future<List<Map<String, List<Ayah>>>> call(int pageNumber) async {
    final ayahsbypages = await repository.fetchAyahsByPage(pageNumber);

    return ayahsbypages;
  }
}
