part of 'suarh_cubit.dart';

abstract class SuarhState {
  const SuarhState();

}

class SuarhInitial extends SuarhState {}

final class QuranLoading extends SuarhState {}
final class FetchSurahSucess extends SuarhState {}
final class FetchSurahError extends SuarhState {
  final String error;

  FetchSurahError(this.error);
}