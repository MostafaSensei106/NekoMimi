import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/config/theme/theme_model.dart';
import 'package:nekomimi/generated/l10n.dart';
import 'package:provider/provider.dart';

class ThemeSwitcherTile extends StatelessWidget {
  const ThemeSwitcherTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return GestureDetector(
          onTap: () {
            themeModel.isDark = !themeModel.isDark;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0.r), // Use ScreenUtil for radius
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(8.0.r), // Use ScreenUtil for padding
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0.r), // Use ScreenUtil for radius
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
                child: Icon(
                  Icons.dark_mode_outlined,
                  size: 24.sp, // Use ScreenUtil for icon size
                ),
              ),
              title: Text(
                S.of(context).DarkModeListTitle,
                style: TextStyle(fontSize: 18.sp), // Use ScreenUtil for text size
              ),
              subtitle: Text(
                S.of(context).DarkModeListSubTitle,
                style: TextStyle(fontSize: 14.sp), // Use ScreenUtil for text size
              ),
              trailing: Switch(
                value: themeModel.isDark,
                onChanged: (value) {
                  themeModel.isDark = value;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
