import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_state.dart';

class LanguageSelectionTile extends StatelessWidget {
  const LanguageSelectionTile({super.key});

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
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        Locale currentLocale = state.locale ?? Locale(window.locale.languageCode);

        return ListTile(
          title: const Text('Language'),
          subtitle: Text(_getLanguageName(currentLocale)),
          trailing: DropdownButton<Locale>(
            value: currentLocale,
            onChanged: (Locale? newValue) {
              if (newValue != null) {
                BlocProvider.of<LanguageCubit>(context).changeLanguage(newValue.languageCode);
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
