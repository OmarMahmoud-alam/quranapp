import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/quran_page.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/domain/entities/surahs_page_data.dart';


@singleton
class LocalDataSource {
  late final Isar _isarInstance;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    log('initializing isar');
    final dir = await getApplicationDocumentsDirectory();
    _isarInstance = await Isar.open(
        [SurahSchema, AyahSchema,SurahPageDataSchema,QuranPageSchema],
      directory: dir.path,
    );
  }
    Isar get isarInstance => _isarInstance;

}
