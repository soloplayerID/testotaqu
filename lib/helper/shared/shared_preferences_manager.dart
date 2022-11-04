import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String keyAccessToken = 'accessToken';
  static const String keyRefreshToken = 'refreshToken';
  static const String keyIsLogin = 'isLogin';
  static const String keyUsername = 'username';
  static const String onBoard = '0';
  static const String expired = '0';

  // set
  static void setId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyAccessToken, value);
  }

  static void setExpired(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(expired, value);
  }

  static void setName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyUsername, value);
  }

  static void setOnboard(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(onBoard, value);
  }

  // get
  static Future<String?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyAccessToken);
  }

  static Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername);
  }

  static Future<String?> getOnboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(onBoard);
  }

  static Future<int?> getExpired() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(expired);
  }

  // remove
  static Future<bool> removeId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyAccessToken);
  }

  static Future<bool> removeName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyUsername);
  }

  //cek
  static Future<bool> checkUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(keyAccessToken);
  }

  static Future<bool> checkOnboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(onBoard);
  }
}
