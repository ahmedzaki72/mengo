import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putStringData({
    @required String key,
    @required dynamic value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> putBoolData({
    @required String key,
    @required dynamic value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getBoolData({@required String key}) {
    return  sharedPreferences.getBool(key);
  }

  static String getStringData({
    @required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> clearData({
    @required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

}
