import 'package:flutter/material.dart';

const kprimaryColor = Color.fromARGB(255, 214, 198, 23);
const ksecondaryColor = Color.fromARGB(243, 222, 137, 10);
const kbackgroundColor = Color.fromARGB(255, 20, 146, 184);

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 20, 142, 224),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kbackgroundColor,
    foregroundColor: kprimaryColor,
    titleTextStyle: TextStyle(
      color: ksecondaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 28,
      letterSpacing: -1,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: ksecondaryColor,
      // letterSpacing: 1.1,
      fontFamily: 'Roboto',
    ),
  ),
);

// final appTheme = CupertinoThemeData(
//   primaryColor: kprimaryColor,
//   primaryContrastingColor: ksecondaryColor,
// );
