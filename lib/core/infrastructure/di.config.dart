// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quranapp/core/data/data_sources/local_data_source.dart' as _i3;
import 'package:quranapp/features/home/data/repositories_imp/quran_repository_imp.dart'
    as _i6;
import 'package:quranapp/features/home/domain/repositories/quran_repository.dart'
    as _i5;
import 'package:quranapp/features/home/domain/usecases/save_quran.dart' as _i7;
import 'package:quranapp/features/home/presentation/controller/quran_data/quran_data_cubit.dart'
    as _i11;
import 'package:quranapp/features/suarh/data/datasources/local_data_source.dart'
    as _i4;
import 'package:quranapp/features/suarh/data/repositories/fetch_quran_repository_imp.dart'
    as _i9;
import 'package:quranapp/features/suarh/domain/repositories/fetch_quran_repository.dart'
    as _i8;
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.singletonAsync<_i3.LocalDataSource>(
      () {
        final i = _i3.LocalDataSource();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.LocalDataSourceFetchSarah>(
      () {
        final i = _i4.LocalDataSourceFetchSarah(gh<_i3.LocalDataSource>());
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i5.QuranRepository>(
        () => _i6.QuranRepositoryImpl(gh<_i3.LocalDataSource>()));
    gh.lazySingleton<_i7.SaveQuranDataIfEmpty>(
        () => _i7.SaveQuranDataIfEmpty(gh<_i5.QuranRepository>()));
    gh.lazySingleton<_i8.FetchQuranRepository>(() =>
        _i9.FetchQuranRepositoryImpl(gh<_i4.LocalDataSourceFetchSarah>()));
    gh.lazySingleton<_i10.FetchSurahAndAyahsUseCase>(
        () => _i10.FetchSurahAndAyahsUseCase(gh<_i8.FetchQuranRepository>()));
    gh.factory<_i11.QuranDataCubit>(
        () => _i11.QuranDataCubit(gh<_i7.SaveQuranDataIfEmpty>()));
    return this;
  }
}
