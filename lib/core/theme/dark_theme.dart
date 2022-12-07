import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme._();
  static DarkTheme? _instance;

  static DarkTheme? get instance {
    _instance ??= DarkTheme._();
    return _instance;
  }

  ThemeData theme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: const Color(0xFF212121),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212121),
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF))),
      scaffoldBackgroundColor: const Color(0xFF303030),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        onPrimary: Color(0xFF000000),
        onSecondary: Color(0xFF000000),
        onError: Color(0xFF000000),
        background: Color(0xFF2D2322),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFF2D2322),
        onSurface: Color(0xFFFFFFFF),
        primary: Color(0xffdc5d5a),
        primaryContainer: Color(0xffd1c4e9),
        secondary: Color(0xff324057),
        secondaryContainer: Color(0xffcfe4ff),
        tertiary: Color(0xff00b0ff),
        tertiaryContainer: Color(0xff9fcbf1),
        error: Color(0xffb00020),
      ));
}
