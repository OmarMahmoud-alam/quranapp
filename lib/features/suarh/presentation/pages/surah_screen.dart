import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/infrastructure/di.dart';
import 'package:quranapp/features/suarh/domain/usecases/fetch.dart';
import 'package:quranapp/features/suarh/presentation/cubit/suarh_cubit.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.surahId});
  final String surahId;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuarhCubit(di<FetchSurahAndAyahsUseCase>())
        ..fetchSurahAndAyahs(int.parse(surahId)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SuarhCubit, SuarhState>(
            builder: (context, state) {
              var temp = BlocProvider.of<SuarhCubit>(context).mergedTextSpan;
              if (state is QuranLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is FetchSurahSucess) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      RichText(
                        text: temp!,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                );
              } else if (state is FetchSurahError) {
                return Center(child: Text(state.error));
              }

              return Center(child: Text('Select a Surah'));
            },
          ),
        ),
        floatingActionButton: BlocBuilder<SuarhCubit, SuarhState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                // Example: Fetch Surah 1 (Al-Fatiha)
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
