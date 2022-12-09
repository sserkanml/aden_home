import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  Future<SharedPreferences> getPreferences() {
    return SharedPreferences.getInstance();
  }

}
