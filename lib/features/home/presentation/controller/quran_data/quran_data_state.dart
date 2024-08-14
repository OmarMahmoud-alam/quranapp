part of 'quran_data_cubit.dart';

sealed class QuranDataState extends Equatable {
  const QuranDataState();

  @override
  List<Object> get props => [];
}

final class QuranDataInitial extends QuranDataState {}

final class FetchSurahDataSuccess extends QuranDataState {}

final class FetchSurahDataFail extends QuranDataState {
  final String error;

  const FetchSurahDataFail({required this.error});
}
final class FetchSurahDataLoading extends QuranDataState {}