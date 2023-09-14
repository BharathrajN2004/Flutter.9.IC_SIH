import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDark => themeMode == ThemeMode.dark;
  ColorScheme get colorScheme => themeMode == ThemeMode.dark
      ? const ColorScheme.dark()
      : const ColorScheme.light();

  void toggleTheme(bool ison) {
    themeMode = ison ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
