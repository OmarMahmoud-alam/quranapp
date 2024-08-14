import 'package:flutter/material.dart';
import 'package:quran/surah_data.dart';
import 'package:quranapp/core/resources/route_manager.dart';
import 'package:quranapp/features/home/presentation/controller/quran_data/quran_data_cubit.dart';
import 'package:quranapp/features/home/presentation/widgets/surah_name_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.cubit,
  });

  final QuranDataCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.white,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const SizedBox(
          height: 40,
          child:  TabBar(
      dividerColor: Colors.transparent,
      tabs: <Widget>[
        Tab(
          text: 'السورة',
        ),
        Tab(
          text: 'الجزء',
        ),
        Tab(
          text: 'المفضلة',
        ),
      ],
    ),
                      ),
        
                   Expanded(child: TabBarView(
    children: <Widget>[
              ListSurahWidget(cubit: cubit), 
                        SizedBox(),
      SizedBox(),
    ],
                      ),
                   )
    
      ],
    ),
                      );
  }
}

class ListSurahWidget extends StatelessWidget {
  const ListSurahWidget({
    super.key,
    required this.cubit,
  });

  final QuranDataCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: cubit.surahs.length,
      separatorBuilder:  (context,index)=>Container(
        width: double.infinity,
        height: 3,
        color: Colors.grey[100],
      ),
      itemBuilder: (context,index){
        return InkWell(
          onTap: ()=> RouteManager.goTo(RouteManager.surah,
                  arguments:cubit.surahs[index].number.toString()),
          child: SurahNameWidget(surah: cubit.surahs[index]));
      }
    
    
    );
  }
}