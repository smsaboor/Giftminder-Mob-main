import 'package:shared_preferences/shared_preferences.dart';

class SharedStorageManager{

  static void saveData(String key, dynamic value) async {
    final preferenceInstances = await SharedPreferences.getInstance();
    if (value is double) {
      preferenceInstances.setDouble(key, value);
    } else if (value is int) {
      preferenceInstances.setInt(key, value);
    } else if (value is String) {
      preferenceInstances.setString(key, value);
    } else if (value is bool) {
      preferenceInstances.setBool(key, value);
      
    } else {
      print("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final preferenceInstances = await SharedPreferences.getInstance();
    dynamic obj = preferenceInstances.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final preferenceInstances = await SharedPreferences.getInstance();
    return preferenceInstances.remove(key);
  }
}