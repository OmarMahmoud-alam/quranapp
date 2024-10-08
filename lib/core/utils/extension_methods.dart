import 'package:flutter/material.dart';

extension IsValidEmail on String {
  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool get containsASpecialCharcater {
    final regExp = RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
        "'"
        ']');
    return regExp.hasMatch(this);
  }
  String removeAllHtmlTags() {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return replaceAll(exp, ' ');
  }
}
extension Arabic on int {
String get intToArabic {
  // Define the Arabic numerals (Unicode values)
  const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  // Convert the integer to a string
  final numberString = this.toString();

  // Map each digit to its Arabic numeral
  final arabicNumberString = numberString.split('').map((digit) {
    return arabicNumerals[int.parse(digit)];
  }).join('');

  return arabicNumberString;
}
}

extension NavExtensions on BuildContext {
  RouteSettings getRouteSettings() => ModalRoute.of(this)!.settings;
}

extension StringExtensions on String {
  String get initials {
    String nameInitials = '';
    if (contains(' ')) {
      nameInitials = split(' ')
          .map((e) => e.characters.first.toUpperCase())
          .take(2)
          .join();
    } else if (contains('.')) {
      nameInitials = split('.')
          .map((e) => e.characters.first.toUpperCase())
          .take(2)
          .join();
    } else {
      nameInitials = characters.first.toUpperCase();
    }

    return nameInitials;
  }
}

extension DatetimeExt on DateTime {
  String get formattedDate => '$year-$month-$day';
}
