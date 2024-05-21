import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentTheme = 'system';
  ThemeMode getThemeMode() {
    if (currentTheme == "light") {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = theme;
    await prefs.setString('theme', theme);
    notifyListeners();
  }

  initializeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getString('theme') ?? 'system';
    notifyListeners();
  }

  //-----------------------------------------------------------------------------------
  String currentLanguage = 'en';
  String getLanguage() {
    if (currentLanguage == 'ar') {
      return 'ar';
    } else {
      return 'en';
    }
  }

  changeLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLanguage = newLanguage;
    await prefs.setString('newLanguage', newLanguage);
    notifyListeners();
  }

  initializeLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLanguage = prefs.getString('newLanguage') ?? 'en';
    notifyListeners();
  }

//-----------------------------------------------------------------------------------
  String quranReaderName = "Abdelbari Al-Toubayti";
  changeQuranReaderName(String newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    quranReaderName = newValue;
    await prefs.setString('newQuranReaderName', newValue);
    notifyListeners();
  }

  initializeQuranReaderName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    quranReaderName =
        prefs.getString('newQuranReaderName') ?? "Abdelbari Al-Toubayti";
    notifyListeners();
  }

 
}
