import 'package:isar/isar.dart';
import 'package:quranapp/features/home/domain/entities/surahs_page_data.dart';
part 'quran_page.g.dart';

@collection
class QuranPage {
  Id id = Isar.autoIncrement;
  final surahPageData = IsarLinks<SurahPageData>();

  final int pagenumber;

  QuranPage( {required this.pagenumber});
}



