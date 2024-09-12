import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:nekomimi/config/theme/dark_theme.dart';
import 'package:nekomimi/config/theme/light_theme.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_state.dart';
import 'package:nekomimi/featureas/home/bloc/chat/love_me_bloc.dart';
import 'package:nekomimi/featureas/home/domin/usecases/get_network_details.dart';
import 'package:nekomimi/featureas/home/presentation/page/main_page.dart';
import 'package:nekomimi/config/theme/theme_model.dart';
import 'package:nekomimi/generated/l10n.dart';

void main() {
  final networkService = NetworkService(); // إنشاء خدمة الشبكة
  final getNetworkDetails = GetNetworkDetails(networkService); // إنشاء GetNetworkDetails
  final loveMeBloc = LoveMeBloc(getNetworkDetails); // إنشاء LoveMeBloc  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => LanguageCubit(),
        ),
        BlocProvider<LoveMeBloc>(
          create: (_) => LoveMeBloc(getNetworkDetails),
        ),
      ],
      child: NekoMimi(getNetworkDetails: getNetworkDetails),
    ),
  );
}

class NekoMimi extends StatelessWidget {
  final GetNetworkDetails getNetworkDetails;

  const NekoMimi({required this.getNetworkDetails});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  title: '猫耳 • Neko Mimi',
                  themeMode: themeModel.themeMode,
                  theme: lightTheme,
                  darkTheme: DarkTheme, // تأكد من اسم الثيم الخاص بالظلام
                  home: const MainPage(),
                  debugShowCheckedModeBanner: false,
                  locale: state.locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                );
              },
            );
          },
        );
      },
    );
  }
}
