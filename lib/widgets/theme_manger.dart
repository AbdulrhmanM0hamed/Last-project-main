import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners(); // إشعار المستمعين عند تغيير الثيم
  }
}
