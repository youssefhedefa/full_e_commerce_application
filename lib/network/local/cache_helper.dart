import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setStartingScreen({
    required String key,
    required bool value,
  }) async {
    return sharedPreferences!.setBool(key, value);
  }

  static bool? getStartingScreen({required String key,})
  {
    return sharedPreferences!.getBool(key);
  }

}
