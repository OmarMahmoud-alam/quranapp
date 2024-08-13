import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranapp/core/data/data_sources/local_data_source.dart';
import 'package:quranapp/core/infrastructure/di.dart';
import 'package:quranapp/core/resources/route_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/features/home/data/repositories_imp/quran_repository_imp.dart';
import 'package:quranapp/features/home/domain/usecases/save_quran.dart';
import 'package:quranapp/features/home/presentation/controller/quran_data/quran_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranDataCubit(di()
              // di.get<SaveQuranDataIfEmpty>()
              /*SaveQuranDataIfEmpty(QuranRepositoryImpl(di()))*/)
            ..saveDataIfNeeded(),
        ),
      ],
      child: BlocBuilder<QuranDataCubit, QuranDataState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: RouteManager.navigatorKey,
            routes: RouteManager.globalRoutes,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: RouteManager.onGenerateGlobalRoute,
            initialRoute: RouteManager.home,
          );
        },
      ),
    );
  }
}
