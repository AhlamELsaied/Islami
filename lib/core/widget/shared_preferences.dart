import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHe {
  static const String _keyFirstOpen = "isFirstOpen";

  static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyFirstOpen) ?? true;
  }

  static Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyFirstOpen, false);
  }
}
