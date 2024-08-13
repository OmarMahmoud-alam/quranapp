import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:quranapp/features/home/domain/usecases/save_quran.dart';

part 'quran_data_state.dart';
@injectable
class QuranDataCubit extends Cubit<QuranDataState> {
final SaveQuranDataIfEmpty saveQuranDataIfEmpty;

  QuranDataCubit(this.saveQuranDataIfEmpty) : super(QuranDataInitial()){
        print('QuranDataCubit Initialized');

  }
void saveDataIfNeeded() async {
  try {
    log('saveDataIfNeeded called');
    await saveQuranDataIfEmpty.call();
  } catch (e) {
    print('Error in saveDataIfNeeded: $e');
  }
}
}