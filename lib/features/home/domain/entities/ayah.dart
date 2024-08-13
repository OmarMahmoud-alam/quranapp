import 'package:isar/isar.dart';
part 'ayah.g.dart';

@collection
class Ayah {
  Id id = Isar.autoIncrement;

  late int number;
  late int surahNumber;
  late String text;
  @override
  String toString(){
    return 'surah Number:$number,text:$text ';
  }
}