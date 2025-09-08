import 'dart:async';

import 'package:final_project/core/utils/theme/themes.dart';
import 'package:final_project/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://59b1cb6cfbed7e3067a9556b658270bd@o4509983721914368.ingest.de.sentry.io/4509983736266832';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  void _change_theme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final_project',
      theme: AppThemes.Light,
      darkTheme: AppThemes.Dark,
      themeMode: _themeMode ,
      home: HomeScreen(change_theme: _change_theme,),
    );
  }
}
