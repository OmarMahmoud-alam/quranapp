import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';

part 'suarh_state.dart';

class SuarhCubit extends Cubit<SuarhState> {
   final FetchSurahAndAyahsUseCase fetchSurahAndAyahsUseCase;
 List<Ayah>  ayahslist=[];
 String?  surahName;
  SuarhCubit(this.fetchSurahAndAyahsUseCase) : super(SuarhInitial());

  Future<void> fetchSurahAndAyahs(int surahNumber) async {
    try {
      emit(QuranLoading());
      final result = await fetchSurahAndAyahsUseCase(surahNumber);
             ayahslist = result['ayahs'];
surahName= result['surahName'];
      emit(FetchSurahSucess());
    } catch (e) {
      emit(FetchSurahError("Failed to load Surah and Ayahs"));
    }
  }

}
