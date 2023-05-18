import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String defaultString = "workout_";
  static String signIn = "${defaultString}signIn";
  static String isIntro = "${defaultString}isIntro";
  static String isFirstTime = "${defaultString}isFirstTime";
  static String isDark = 'isDark';
  static String token = 'token';
  static String profileImage = 'profileImage';

  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setIsSignIn(bool isFav) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(signIn, isFav);
  }

  Future<bool> getIsSignIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(signIn) ?? false;
  }

  void setIsIntro(bool isFav) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(isIntro, isFav);
  }

  getIsIntro() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(isIntro) ?? true;
  }

  void setIsFirstTime(bool isFav) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(isFirstTime, isFav);
  }

  getIsFirstTime() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(isFirstTime) ?? true;
  }

  void setThemeMode(bool isFav) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(isDark, isFav);
  }

  Future<bool> getThemeMode() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(isDark) ?? true;
  }

  void setToken(String accessToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(token, accessToken);
  }

  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(token) ?? '';
  }

  // void setprofileImage(String accessToken) async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setString(profileImage, accessToken);
  // }

  // Future<String> getprofileImage() async {
  //   prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(profileImage) ?? '';
  // }
}
