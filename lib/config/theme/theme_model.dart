import 'package:flutter/material.dart';
import 'package:nekomimi/config/theme/theme_shared_prefrences.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPrefrences themeSharedPrefrences;
  ThemeMode _themeMode = ThemeMode.system;

  bool get isDark => _isDark;
  ThemeMode get themeMode => _themeMode;

  ThemeModel() {
    themeSharedPrefrences = ThemeSharedPrefrences();
    _initializeTheme();
  }

  set isDark(bool value) {
    _isDark = value;
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    themeSharedPrefrences.setTheme(value);
    notifyListeners();
  }

  void _initializeTheme() async {
    bool? isFirstRun = await themeSharedPrefrences.isFirstRun();
    if (isFirstRun == null || isFirstRun) {
      _themeMode = ThemeMode.system;
      _isDark =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      await themeSharedPrefrences.setFirstRun(false);
    } else {
      _isDark = await themeSharedPrefrences.getTheme();
      _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }
}
