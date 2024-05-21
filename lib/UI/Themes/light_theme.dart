import 'package:flutter/material.dart';

class LightTheme {
  static Color primaryLight = const Color(0xffB7935F);
  static Color secondaryLight = const Color(0xffB7935F);
  static Color onPrimaryLight = Colors.white;
  static Color onSecondaryLight = Colors.black;
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: onSecondaryLight),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 30, color: onSecondaryLight, fontWeight: FontWeight.w700),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: onSecondaryLight,
      selectedIconTheme: const IconThemeData(size: 34),
      unselectedItemColor: onPrimaryLight,
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      color: onPrimaryLight,
    ),
    iconTheme: IconThemeData(color: onSecondaryLight, size: 30),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            //quran & hadeth title font
            color: onSecondaryLight,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            //quran & hadeth semi title font
            color: onSecondaryLight,
            fontSize: 25,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            //quran & hadeth body font
            color: onSecondaryLight,
            fontSize: 20,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            // sebha title button
            color: onPrimaryLight,
            fontSize: 25,
            fontWeight: FontWeight.w400),
        displayLarge: TextStyle(
            color: onPrimaryLight, fontSize: 25, fontWeight: FontWeight.w400),
        displayMedium: TextStyle(
            color: primaryLight, fontSize: 25, fontWeight: FontWeight.w400),
        displaySmall: TextStyle(
            color: onSecondaryLight, fontSize: 25, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: onSecondaryLight, fontSize: 20, fontWeight: FontWeight.w400),
        headlineSmall: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLight,
      primary: primaryLight,
      secondary: secondaryLight,
      onPrimary: onPrimaryLight,
      onSecondary: onSecondaryLight,
    ),
    dividerColor: primaryLight,
  );
}
