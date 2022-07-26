// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.light;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF101D24),
    primaryColor: black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(
      color: white,
      opacity: 0.8,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Color(0xFF232D35),
      textStyle: TextStyle(
        color: white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF232D35),
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF232D35),
      contentTextStyle: TextStyle(
        color: white,
        fontSize: 17,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    primaryColor: white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(
      color: black,
      opacity: 0.8,
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyle(
        color: black,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: one,
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}
