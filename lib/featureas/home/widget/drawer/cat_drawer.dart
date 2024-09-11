import 'package:flutter/material.dart';
import 'package:nekomimi/config/theme/theme_model.dart';
import 'package:nekomimi/featureas/home/widget/drawer/cat_about_neko.dart';
import 'package:nekomimi/featureas/home/widget/drawer/cat_contact_dev.dart';
import 'package:nekomimi/featureas/home/widget/drawer/cat_drawer_header.dart';
import 'package:nekomimi/featureas/home/widget/drawer/theme_swither.dart';
import 'package:provider/provider.dart';


class CatDrawer extends StatelessWidget {
  const CatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double hScreenWidth = screenWidth * 0.85;
    double hScreenHeight = screenHeight * 0.25;

    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return SizedBox(
          width: hScreenWidth,
          child: Drawer(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .surface,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23),
                topLeft: Radius.circular(23),
               // bottomLeft: Radius.circular(23),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                    height: hScreenHeight, child: TaDrawerHeader()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surfaceContainer,
                        ),
                        child: const ThemeSwitcherTile(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surfaceContainer,
                        ),
                        child: const Column(
                          children: [
                            TaContactDev(),
                            Divider(),
                            AboutNeko(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      );
  }
}
