import 'package:isar/isar.dart';
part  'surah.g.dart';

@collection
class Surah {
  Id id = Isar.autoIncrement;

  late int number;
  late String name;
  late int ayahCount;
}

