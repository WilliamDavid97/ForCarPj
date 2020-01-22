import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const apiTest = "apiTest";

  static Future<bool> setData({String key, String value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
    return true;
  }

  static Future<String> getData({String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<bool> setList({String key, List<String> value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, value);
    return true;
  }

  static Future<List<String>> getList({String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(key);
  }
}
