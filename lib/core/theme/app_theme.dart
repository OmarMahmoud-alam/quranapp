import 'package:flutter/material.dart';
import 'package:quranapp/core/configs/strings.dart';



class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    //primaryColor: AppColors.primaryColor,
   // primarySwatch: AppColors.primarySwatch,
  //  colorScheme: AppColors.mainColorScheme,
  //  scaffoldBackgroundColor: AppColors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    fontFamily: Strings.fontFamily,
    //textSelectionTheme: textSelectionThemeData,
  //  inputDecorationTheme: inputDecorationTheme,
   // appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(
 //     color: AppColors.primaryColor,
    ),
    datePickerTheme: DatePickerThemeData(
  //    headerHeadlineStyle: TextThemes.textTheme.titleLarge,
    ),
    timePickerTheme: TimePickerThemeData(
  //    hourMinuteTextStyle: TextThemes.textTheme.titleLarge,
    ),
  //  textTheme: TextThemes.textTheme,
    typography: Typography(),
  );
}
