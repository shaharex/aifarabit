import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('user');
  }

  static Future<void> saveUser(String username, String city, List<String> prefs, String country) async {
    final box = Hive.box('user');
    await box.put('username', username);
    await box.put('city', city);
    await box.put('prefs', prefs);
    await box.put('country', country);
  }

  static Future<void> updateUsername(String username) async {
    final box = Hive.box('user');
    await box.put('username', username);
  }

  static Future<String> getUsername() async {
    final value = Hive.box('user').get('username');
    return value?.toString() ?? '';
  }

  static Future<String> getCity() async {
    final value = Hive.box('user').get('city');
    return value?.toString() ?? '';
  }

  static Future<List<String>> getPrefs() async {
    final value = Hive.box('user').get('prefs');
    if (value == null) return [];
    return (value as List).map((e) => e.toString()).toList();
  }

  static Future<String> getCountry() async {
    final value = Hive.box('user').get('country');
    return value?.toString() ?? '';
  }

  static Future<void> clearUser() async{
    await Hive.box('user').clear();
  }
}
