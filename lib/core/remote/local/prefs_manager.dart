import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
  static late SharedPreferences sharedPreferences;
  static Future<void> init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveToken(String token){
    sharedPreferences.setString("token", token);
  }

  static String getToken(){
    return sharedPreferences.getString("token")??"";
  }

  static clearToken(){
    sharedPreferences.remove("token");
  }
}