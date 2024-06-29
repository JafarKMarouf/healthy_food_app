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

  static Future<void> storeVerifedEmail(bool verified) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool('verifed', verified);
  }

  static Future<bool?> getVerifiedEmail() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool('verifed');
  }

  static Future<void> removeVerify() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('verifed');
  }

  static Future<void> rememeberMe(bool remembered) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool('rememberMe', remembered);
  }

  static Future<bool?> isRemembered() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getBool('rememberMe');
  }

  static Future<void> storeUserName(String username) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('userName', username);
  }

  static Future<String?> getUserName() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getString('userName');
  }

  static Future<void> storeEmail(String email) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('email_remember', email);
  }

  static Future<String?> getEmailRemember() async {
    prefs = await SharedPreferences.getInstance();

    return prefs!.getString('email_remember');
  }

  static Future<void> storeMobile(String mobile) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('mobile_remember', mobile);
  }

  static Future<String?> getMobileRemember() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('mobile_remember');
  }

  static Future<void> storePass(String password) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('password_remember', password);
  }

  static Future<String?> getPassRemember() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('password_remember');
  }

  static storeCertificate(String file)async{
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('certificate',file );
  }

  static Future<String?> getCertificate() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('certificate');
  }

  static Future<void> removeFile() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('file');
  }

  static storeImage(String image)async{
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('image',image );
  }

  static Future<String?> getImage() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('image');
  }

  static Future<void> removeImage() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('image');
  }

  static Future<void> removeRememberedCred() async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.remove('email_remember');
    await prefs!.remove('mobile_remember');
    await prefs!.remove('password_remember');
  }
}
