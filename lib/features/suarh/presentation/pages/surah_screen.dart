import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/infrastructure/di.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';
import 'package:quranapp/features/suarh/presentation/cubit/suarh_cubit.dart';
import 'package:quranapp/features/suarh/presentation/widgets/surah.dart';

import '../widgets/surah_body.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.surahId});
  final String surahId;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuarhCubit(di<FetchSurahAndAyahsUseCase>())
        ..fetchSurahAndAyahs(int.parse(surahId)),
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: BlocBuilder<SuarhCubit, SuarhState>(
              builder: (context, state) {
                if (state is QuranLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FetchSurahSucess) {
                  return const SurahBody();
                } else if (state is FetchSurahError) {
                  return Center(child: Text(state.error));
                }
          
                return const Center(child: Text('Select a Surah'));
              },
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<SuarhCubit, SuarhState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                BlocProvider.of<SuarhCubit>(context)
                    .fetchSurahAndAyahs(int.parse(surahId) + 3);
              },
              child: Icon(Icons.next_plan),
            );
          },
        ),
      ),
    );
  }
}
