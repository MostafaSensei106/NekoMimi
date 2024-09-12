// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Neko Mimi`
  String get title {
    return Intl.message(
      'Neko Mimi',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `DarkMode`
  String get DarkModeListTitle {
    return Intl.message(
      'DarkMode',
      name: 'DarkModeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Appearance`
  String get DarkModeListSubTitle {
    return Intl.message(
      'Change Appearance',
      name: 'DarkModeListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dev`
  String get DevListTitle {
    return Intl.message(
      'Dev',
      name: 'DevListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Support,Contact Dev`
  String get DevListSubTitle {
    return Intl.message(
      'Support,Contact Dev',
      name: 'DevListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dev DM`
  String get DevDM {
    return Intl.message(
      'Dev DM',
      name: 'DevDM',
      desc: '',
      args: [],
    );
  }

  /// `I made this application when I was sitting empty and couldn’t find anything to do, so enjoy. If you Like my App, you can buy me a coffee to support future projects.`
  String get SupportMeMassage {
    return Intl.message(
      'I made this application when I was sitting empty and couldn’t find anything to do, so enjoy. If you Like my App, you can buy me a coffee to support future projects.',
      name: 'SupportMeMassage',
      desc: '',
      args: [],
    );
  }

  /// `Thank you very much. <3`
  String get DevThx {
    return Intl.message(
      'Thank you very much. <3',
      name: 'DevThx',
      desc: '',
      args: [],
    );
  }

  /// `Support Developer`
  String get SupportMeBtn {
    return Intl.message(
      'Support Developer',
      name: 'SupportMeBtn',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me @Mostafa_Sensei106`
  String get ContactDev {
    return Intl.message(
      'Contact Me @Mostafa_Sensei106',
      name: 'ContactDev',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get AboutAppListTitle {
    return Intl.message(
      'About App',
      name: 'AboutAppListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Learn More About App`
  String get AboutAppListSubTitle {
    return Intl.message(
      'Learn More About App',
      name: 'AboutAppListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Neko Mimi is A trolling application I made when I was sitting empty and couldnt find anything to do so enjoy`
  String get AboutApp {
    return Intl.message(
      'Neko Mimi is A trolling application I made when I was sitting empty and couldnt find anything to do so enjoy',
      name: 'AboutApp',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get License {
    return Intl.message(
      'License',
      name: 'License',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'jp'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
