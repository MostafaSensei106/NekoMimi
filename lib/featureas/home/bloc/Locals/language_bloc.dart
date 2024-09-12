import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(locale: Locale(ui.window.locale.languageCode))) {
    _loadSavedLanguage();
  }

  Future<void> _saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
  }

  Future<void> _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString('language_code');

    if (savedLanguageCode != null) {
      emit(LanguageState(locale: Locale(savedLanguageCode)));
    } else {
      String systemLanguageCode = ui.window.locale.languageCode;
      emit(LanguageState(locale: Locale(systemLanguageCode)));
    }
  }

  void changeLanguage(String languageCode) {
    Locale newLocale = Locale(languageCode);
    emit(LanguageState(locale: newLocale));
    _saveLanguage(languageCode);
  }
}
