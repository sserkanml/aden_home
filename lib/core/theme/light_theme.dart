import 'package:flutter/material.dart';

class LightTheme {
  LightTheme._();
  static LightTheme? _instance;

  static LightTheme? get instance {
    _instance ??= LightTheme._();
    return _instance;
  }

  ThemeData theme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      canvasColor: Color(0xFFFAFAFA),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFAFAFA),
      iconTheme: IconThemeData(
        color: Color(0xFF000000)
      )),
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffdc5d5a),
        primaryContainer: Color(0xffd1c4e9),
        secondary: Color(0xff324057),
        secondaryContainer: Color(0xffcfe4ff),
        tertiary: Color(0xff00b0ff),
        tertiaryContainer: Color(0xff9fcbf1),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onError: Color(0xFFFFFFFF),
        background: Color(0xFFFDF7FB),
        onBackground: Color(0xFF000000),
        onSurface: Color(0xFF000000),
        surface: Color(0xFFFDF7FB),
        error: Color(0xffb00020),
      ));
}
