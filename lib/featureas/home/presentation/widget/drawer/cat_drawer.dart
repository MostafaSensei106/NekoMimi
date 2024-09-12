import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/config/theme/theme_model.dart';
import 'package:nekomimi/core/Ta_Divider.dart';
import 'package:nekomimi/featureas/home/presentation/widget/drawer/cat_about_neko.dart';
import 'package:nekomimi/featureas/home/presentation/widget/drawer/cat_contact_dev.dart';
import 'package:nekomimi/featureas/home/presentation/widget/drawer/cat_darawer_locals.dart';
import 'package:nekomimi/featureas/home/presentation/widget/drawer/theme_swither.dart';
import 'package:provider/provider.dart';

import 'cat_drawer_header.dart';

class CatDrawer extends StatelessWidget {
  const CatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return SizedBox(
          width: 0.85.sw,
          child: Drawer(
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(23.r),
                bottomRight: Radius.circular(23.r),
                bottomLeft: Radius.circular(23.r),
                topLeft: Radius.circular(23.r),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 0.25.sh,
                  child:  TaDrawerHeader(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w), // Use ScreenUtil for padding
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0.r), // Use ScreenUtil for border radius
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        child: const ThemeSwitcherTile(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0.h), // Use ScreenUtil for margin
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0.r), // Use ScreenUtil for border radius
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        child: const Column(
                          children: [
                            LanguageSelectionTile(),
                            TaDivider(),
                            TaContactDev(),
                            TaDivider(),
                            AboutNeko(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
