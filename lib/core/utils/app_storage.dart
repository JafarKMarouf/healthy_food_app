import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static GetStorage storage = GetStorage();
  static Future<void> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // var token = await storage.read('token');
    log('=====read token $token========');
    return token;
  }

  static Future<void> removeToken() async {
    // GetStorage storage = GetStorage();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // await storage.remove('token');
  }
}
