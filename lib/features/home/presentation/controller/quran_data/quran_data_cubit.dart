import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:quranapp/features/home/domain/entities/surah.dart';
import 'package:quranapp/features/home/domain/usecases/save_quran.dart';

part 'quran_data_state.dart';
@injectable
class QuranDataCubit extends Cubit<QuranDataState> {
final SaveQuranDataIfEmpty saveQuranDataIfEmpty;
List<Surah> surahs=[];
  QuranDataCubit(this.saveQuranDataIfEmpty) : super(QuranDataInitial()){
        print('QuranDataCubit Initialized');

  }
void saveDataIfNeeded() async {
  emit(FetchSurahDataLoading());
  try {
    log('saveDataIfNeeded called');
   surahs= await saveQuranDataIfEmpty.call();
   emit(FetchSurahDataSuccess());
  } catch (e) {
    print('Error in saveDataIfNeeded: $e');
   emit(FetchSurahDataFail(error: e.toString()));

  }
}
}