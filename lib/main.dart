import 'dart:async';
import 'package:final_project/core/services/utils/database_services.dart';
import 'package:final_project/core/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/routes/app_pages.dart';
import 'core/bindings/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  await Get.putAsync(() async => await DatabaseServices().init());

  await SentryFlutter.init((options) {
    options.dsn =
        'https://59b1cb6cfbed7e3067a9556b658270bd@o4509983721914368.ingest.de.sentry.io/4509983736266832';
    options.tracesSampleRate = 1.0;
  }, appRunner: () => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      init: Get.find<ThemeController>(),
      builder: (themeController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.init,
          getPages: AppPages.routes,
          title: 'Notes',
          initialBinding: AppBinding(),
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: ThemeController().isDark ? ThemeMode.dark : ThemeMode.light
        );
      },
    );
  }
}
