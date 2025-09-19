import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppThemes {
  static const Color primary = Color(0xFF1E3A8A);
  static const Color primaryDark = Color(0xFF0F172A);
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      accentColor: primary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.white), 
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primary,
      splashColor: primary.withOpacity(0.5),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      accentColor: primaryDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.white), 
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      
      splashColor: primaryDark.withOpacity(0.5),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
           backgroundColor: primaryDark,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    
  );
}

class ThemeController extends GetxController{
  bool isDark = true;
  void toggleTheme(){
    isDark = !isDark;

    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);

    update();
  }


}
