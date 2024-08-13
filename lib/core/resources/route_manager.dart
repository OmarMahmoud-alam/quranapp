import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/features/home/presentation/pages/home.dart';
import 'package:quranapp/features/suarh/presentation/pages/surah_screen.dart';

class RouteManager {
  RouteManager._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future<dynamic> goTo(String routeName,
      {GlobalKey<NavigatorState>? navKey, Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return await navKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static Future<dynamic> replace(String routeName,
      {GlobalKey<NavigatorState>? navKey, Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return await navKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  static Future<dynamic> replaceUntilOrAll(String routeName,
      {GlobalKey<NavigatorState>? navKey,
      String? until,
      Object? arguments}) async {
    if (navKey == null) {
      return await navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,
          (route) {
        if (until != null) {
          return route.settings.name == until;
        } else {
          return false;
        }
      }, arguments: arguments);
    } else {
      return await navKey.currentState!.pushNamedAndRemoveUntil(routeName,
          (route) {
        if (until != null) {
          return route.settings.name == until;
        } else {
          return false;
        }
      }, arguments: arguments);
    }
  }

  static void popUntil(String? routeName, {GlobalKey<NavigatorState>? navKey}) {
    if (navKey == null) {
      navigatorKey.currentState!.popUntil((route) {
        if (routeName != null) {
          return route.settings.name == routeName;
        } else {
          return false;
        }
      });
    } else {
      navKey.currentState!.popUntil((route) {
        if (routeName != null) {
          return route.settings.name == routeName;
        } else {
          return false;
        }
      });
    }
  }

  static void pop({Object? result, GlobalKey<NavigatorState>? navKey}) {
    if (navKey == null) {
      navigatorKey.currentState!.pop(result);
    } else {
      navKey.currentState!.pop(result);
    }
  }

  static const String home = '/';
  static const String surah = '/surah';

 /* static const String auth = '/auth';
  static const String layout = '/layout';
  static const String changePassword = '/changePassword';
  static const String profile = '/profile';
  static const String ticketsFilter = '/ticketsFilter';
  static const String ticketDetails = '/ticketsDetails';
  static const String createTicket = '/createTicket';
  static const String reports = '/reports';*/

  static Map<String, WidgetBuilder> globalRoutes = {
    surah: (context) {
      final String surahId = ModalRoute.of(context)!.settings.arguments as String;
      return SurahScreen(
        surahId: surahId,
      );
    },
    home: (context)=>const Home()
    /*splash: (context) => di<LocalDataSource>().isUserExists()
        ? const LayoutScreen()
        : const BaseAuthScreen(),*/
    /*auth: (context) => const BaseAuthScreen(),
    layout: (context) => const LayoutScreen(),
    changePassword: (context) => const ChangePasswordScreen(),
    profile: (context) => const ProfileScreen(),
    ticketsFilter: (context) => const TicketsFilterScreen(),
    ticketDetails: (context) {
      final int ticketID = ModalRoute.of(context)!.settings.arguments as int;
      return TicketDetailsScreen(
        ticketID: ticketID,
      );
    },
    createTicket: (context) => const CreateTicketScreen(),
    reports: (context) => const ReportsScreen(),*/
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateGlobalRoute =
      (settings) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return globalRoutes[settings.name]!(context);
      },
    );
    //   if (Platform.isAndroid) {
    //     return MaterialPageRoute(
    //       settings: settings,
    //       builder: globalRoutes[settings.name]!,
    //     );
    //   } else {
    //     return CupertinoPageRoute(
    //       settings: settings,
    //       builder: globalRoutes[settings.name]!,
    //     );
    //   }
  };
}

typedef RouteHandler = Widget Function(
    RouteSettings settings, BuildContext context);
