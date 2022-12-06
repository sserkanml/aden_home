class LightTheme {
  LightTheme._();
  static LightTheme? _instance;

  static LightTheme? get instance {
    _instance ??= LightTheme._();
    return _instance;
  }
}
