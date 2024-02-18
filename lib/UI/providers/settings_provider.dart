import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (theme == newTheme) return;
    theme = newTheme;
    notifyListeners();
  }

  String Language = 'en';
  void changeLanguage(String newLanguage) {
    if (Language == newLanguage) return;
    Language = newLanguage;
    notifyListeners();
  }
}
