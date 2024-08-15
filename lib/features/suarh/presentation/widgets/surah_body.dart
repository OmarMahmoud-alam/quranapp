import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/features/suarh/presentation/cubit/suarh_cubit.dart';
import 'package:quranapp/features/suarh/presentation/widgets/surah.dart';

class SurahBody extends StatelessWidget {
  const SurahBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount:  BlocProvider.of<SuarhCubit>(context).ayahByPages.length+1,
        itemBuilder: (BuildContext context, int index) {
          if(index==0){
            return   AppBarOfSurah();
          }
                    print(BlocProvider.of<SuarhCubit>(context).ayahByPages[index-1].values.expand((ayahs) => ayahs).toList());

          return      MergedAyahTextSpan(ayahs: BlocProvider.of<SuarhCubit>(context).ayahByPages[index-1].values.expand((ayahs) => ayahs).toList() );
        },
      ),
      
      
      
    );
  }
}

class AppBarOfSurah extends StatelessWidget {
  const AppBarOfSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 30,
    child: Stack(
      children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/image/surahname.png',height: 40,width: 150,fit: BoxFit.fill,)),
          Align(
          child:  Text('سورة ${BlocProvider.of<SuarhCubit>(context).surahName!} ')
          )
      ],
    ),);
  }
}

/*
class SurahBody extends StatelessWidget {
  const SurahBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(
height: 30,
child: Stack(
  children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/image/surahname.png',height: 40,width: 150,fit: BoxFit.fill,)),
                Align(
                child:  Text('سورة ${BlocProvider.of<SuarhCubit>(context).surahName!} ')
                )
  ],
),),

          SizedBox(
            height: 20,
          ),
      MergedAyahTextSpan(ayahs: BlocProvider.of<SuarhCubit>(context).ayahslist ),
          
        ],
      ),
    );
  }
}
*/