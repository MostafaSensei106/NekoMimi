import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_event.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_state.dart';

class LanguageSelectionTile extends StatelessWidget {
  const LanguageSelectionTile({super.key});

  // دالة لتحويل كود اللغة إلى اسم اللغة القابلة للعرض
  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'ja':
        return '日本語';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        Locale currentLocale =
            state.locale ?? Locale(window.locale.languageCode); // لغة النظام الافتراضية

        return ListTile(
          title: const Text('Language'),
          subtitle: Text(_getLanguageName(currentLocale)), // يعرض اللغة الحالية
          trailing: DropdownButton<Locale>(
            value: currentLocale,
            onChanged: (Locale? newValue) {
              if (newValue != null) {
                BlocProvider.of<LanguageBloc>(context).add(ChangeLanguageEvent(newValue));
              }
            },
            items: const [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: Locale('ar'),
                child: Text('العربية'),
              ),
              DropdownMenuItem(
                value: Locale('ja'),
                child: Text('日本語'),
              ),
            ],
          ),
        );
      },
    );
  }
}
