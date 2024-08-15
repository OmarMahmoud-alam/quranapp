import 'package:isar/isar.dart';
part 'surahs_page_data.g.dart';

@collection
class SurahPageData {
  Id id = Isar.autoIncrement;

  final int surah;
  final int start;
  final int end;

  SurahPageData({required this.surah, required this.start, required this.end});
  @override
  String toString() {
    return 'SurahPageData{id: $id, surah: $surah, start: $start, end: $end}';}
}

