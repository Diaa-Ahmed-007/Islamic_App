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

  initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLanguage = prefs.getString('newLanguage') ?? 'en';
       currentTheme = prefs.getString('theme') ?? 'system';
    notifyListeners();
  }
}
