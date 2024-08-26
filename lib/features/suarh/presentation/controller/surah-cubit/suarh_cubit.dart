import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch_ayah_per_page.dart';

part 'suarh_state.dart';

class SuarhCubit extends Cubit<SuarhState> {
   final FetchAyahsPageUseCase fetchSurahByAyah;
   final FetchSurahAndAyahsUseCase fetchSurahAndAyahsUseCase;
 List<Ayah>  ayahslist=[];
 List<Map<int, List<Ayah>>> ayahByPages=[];
 String?  surahName;
  SuarhCubit(this.fetchSurahAndAyahsUseCase, this.fetchSurahByAyah) : super(SuarhInitial());

  Future<void> fetchSurahAndAyahs(int surahNumber) async {
    try {
      emit(QuranLoading());
      final result = await fetchSurahAndAyahsUseCase(surahNumber);
             ayahslist = result['ayahs'];
surahName= result['surahName'];
ayahByPages= result['ayahspages'];
log("length:${ayahByPages.length}");
      emit(FetchSurahSucess());
    } catch (e) {
      emit(FetchSurahError("Failed to load Surah and Ayahs"));
    }
  }

}
