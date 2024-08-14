
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quranapp/features/home/presentation/controller/quran_data/quran_data_cubit.dart';

import '../widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection:TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.greenAccent,
            title: const Text('القران الكريم'),
            actions: [
              IconButton(onPressed: (){}, icon:const Icon( Icons.search)),
              IconButton(onPressed: (){}, icon:const Icon( Icons.settings))
            ],
          ),
          body:     BlocBuilder<QuranDataCubit, QuranDataState>(
            builder: (context, state) {
              if(state is FetchSurahDataSuccess){
                    return HomeBody(cubit: BlocProvider.of<QuranDataCubit>(context));
              }
              if(state is FetchSurahDataLoading){
                return const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(),
                );
              }
              return const Center(
                child: Text('Home'),
              );
            },
          ),
        ),
      ),
    );
  }
}

String translateToArabic(String input) {
  if (input == "Madinah") {
    return "مدنية";
  } else if (input == "Makkah") {
    return "مكية";
  } else {
    return input; // Return the original string if it doesn't match "Madinah" or "Makkah"
  }
}
