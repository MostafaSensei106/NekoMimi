import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
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
          leading: Container(
            padding: EdgeInsets.all(8.0.r), // Use ScreenUtil for padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0.r), // Use ScreenUtil for radius
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
            child: Icon(
              Icons.language, // Add an icon here
              size: 24.sp, // Use ScreenUtil for icon size
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          title: Text(
            'Language',
            style: TextStyle(fontSize: 18.sp), // Use ScreenUtil for text size
          ),
          subtitle: Text(
            _getLanguageName(currentLocale),
            style: TextStyle(fontSize: 14.sp), // Use ScreenUtil for text size
          ),
          trailing: DropdownButton<Locale>(
            elevation: 0,
            borderRadius: BorderRadius.circular(14.r),
            value: currentLocale,
            onChanged: (Locale? newValue) {
              if (newValue != null) {
                BlocProvider.of<LanguageCubit>(context).changeLanguage(newValue.languageCode);
              }
            },
            items: [
              DropdownMenuItem(
                value: const Locale('en'),
                child: Row(
                  children: [
                    Icon(Icons.language, size: 20.sp),
                    // Add icon for dropdown items
                    SizedBox(width: 10.w),
                    // Use ScreenUtil for spacing
                    const Text('English'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: const Locale('ar'),
                child: Row(
                  children: [
                    Icon(Icons.language, size: 20.sp),
                    // Add icon for dropdown items
                    SizedBox(width: 10.w),
                    // Use ScreenUtil for spacing
                    const Text('العربية'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: const Locale('ja'),
                child: Row(
                  children: [
                    Icon(Icons.language, size: 20.sp),
                    // Add icon for dropdown items
                    SizedBox(width: 10.w),
                    // Use ScreenUtil for spacing
                    const Text('日本語'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
