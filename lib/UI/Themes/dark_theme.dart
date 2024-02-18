import 'package:flutter/material.dart';

class DarkTheme {
  static Color primaryDark = const Color(0xffFACC1D);
  static Color secondaryDark = const Color(0xff141A2E);
  static Color onPrimaryDark = Colors.white;
  static Color onSecondaryDark = Colors.black;
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: onPrimaryDark),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 30, color: onPrimaryDark, fontWeight: FontWeight.w700),
    ),
    //------------------------------------------------------------
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryDark,
      selectedIconTheme: const IconThemeData(size: 34),
      unselectedItemColor: onPrimaryDark,
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
    //-----------------------------------------------------------
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: secondaryDark),
    iconTheme: IconThemeData(color: primaryDark, size: 30),
    cardTheme: CardTheme(
      elevation: 2,
      color: secondaryDark,
    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: onPrimaryDark, fontSize: 25, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            color: onPrimaryDark, fontSize: 25, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: primaryDark, fontSize: 20, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
            color: primaryDark, fontSize: 25, fontWeight: FontWeight.w400),
        displayLarge: TextStyle(
            color: onSecondaryDark, fontSize: 25, fontWeight: FontWeight.w400),
        // gold & semigold
        // gold & black
        displayMedium: TextStyle(
            color: primaryDark, fontSize: 25, fontWeight: FontWeight.w400),
        displaySmall: TextStyle(
            color: primaryDark, fontSize: 25, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: onPrimaryDark, fontSize: 20, fontWeight: FontWeight.w400)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryDark,
      primary: primaryDark,
      secondary: secondaryDark,
      onPrimary: onPrimaryDark,
      onSecondary: onSecondaryDark,
    ),
    dividerColor: primaryDark,
  );
}
