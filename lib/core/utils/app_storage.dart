import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static late SharedPreferences? prefs;

  static Future<void> storeToken(String token) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('token', token);
  }

  static Future<String?> getToken() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getString('token');
  }

  static Future<void> removeToken() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('token');
  }

  static Future<void> rememeberMe(bool remembered) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool('rememberMe', remembered);
  }

  static Future<bool?> isRemembered() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getBool('rememberMe');
  }

  static Future<void> storeEmail(String email) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('email_remember', email);
  }

  static Future<String?> getEmailRemeber() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getString('email_remember');
  }

  static Future<void> storeMobile(String mobile) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('mobile_remember', mobile);
  }

  static Future<String?> getMobileRemeber() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('mobile_remember');
  }

  static Future<void> storePass(String password) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('password_remember', password);
  }

  static Future<String?> getPassRemeber() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('password_remember');
  }
}
