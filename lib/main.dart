import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/config/theme/dark_theme.dart';
import 'package:nekomimi/config/theme/light_theme.dart';
import 'package:nekomimi/config/theme/theme_model.dart';
import 'package:nekomimi/featureas/home/page/love_me.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const NekoMimi(),
    ),
  );
}

class NekoMimi extends StatelessWidget {
  const NekoMimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            title: '猫耳 • Neko Mimi',
            themeMode: themeModel.themeMode,
            theme: lightTheme,
            darkTheme: DarkTheme,
            home: const LoveMePage(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}