import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';


@singleton
class LocalDataSource {
  late final Isar _isarInstance;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    log('initializing isar');
    final dir = await getApplicationDocumentsDirectory();
    _isarInstance = await Isar.open(
        [SurahSchema, AyahSchema],

      directory: dir.path,
    );
  }
    Isar get isarInstance => _isarInstance;

/*
  void saveUser(User user) {
    _isarInstance.writeTxnSync(() {
      _isarInstance.users.putSync(user); // insert & update
    });
  }

  bool isUserExists() {
    return _isarInstance.users.countSync() > 0;
  }

  User? returnUser() {
    return _isarInstance.users.getSync(7355608);
  }

*/
}
