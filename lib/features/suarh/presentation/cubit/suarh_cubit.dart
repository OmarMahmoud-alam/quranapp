import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/features/home/domain/entities/ayah.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';

part 'suarh_state.dart';

class SuarhCubit extends Cubit<SuarhState> {
   final FetchSurahAndAyahsUseCase fetchSurahAndAyahsUseCase;
 TextSpan?  mergedTextSpan;
  SuarhCubit(this.fetchSurahAndAyahsUseCase) : super(SuarhInitial());

  Future<void> fetchSurahAndAyahs(int surahNumber) async {
    try {
      emit(QuranLoading());
      final result = await fetchSurahAndAyahsUseCase(surahNumber);
             mergedTextSpan = _mergeAyahsIntoTextSpan(result['ayahs']);

      emit(FetchSurahSucess());
    } catch (e) {
      emit(FetchSurahError("Failed to load Surah and Ayahs"));
    }
  }
  TextSpan _mergeAyahsIntoTextSpan(List<Ayah> ayahs) {
    return TextSpan(
      children: ayahs.map((ayah) {
        return TextSpan(
          text: '${ayah.text} ', // You can customize this further
          style: TextStyle(
            fontSize: 16, // Customize your text style
            color: Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
