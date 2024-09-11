import 'package:flutter/material.dart';
import 'package:nekomimi/config/theme/dark_theme.dart';
import 'package:nekomimi/config/theme/light_theme.dart';
import 'package:nekomimi/featureas/home/page/love_me.dart';

void main() {
  runApp(const LoveMeApp());
}

class LoveMeApp extends StatelessWidget {
  const LoveMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neko Mimi',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system, // يستخدم إعدادات الجهاز
      home: const LoveMePage(),
    );
  }
}
