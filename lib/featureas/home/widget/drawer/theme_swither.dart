import 'package:flutter/material.dart';
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
              borderRadius: BorderRadius.circular(14.0),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
                child: const Icon(
                  Icons.dark_mode_outlined,
                  size: 27,
                ),
              ),
              title:  Text(
                S.of(context).DarkModeListTitle,
              ),
              subtitle:  Text(
                S.of(context).DarkModeListSubTitle,
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
