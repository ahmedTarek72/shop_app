import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static SharedPreferences? sharedPreferences;
  static void init() async{
  sharedPreferences  = await SharedPreferences.getInstance();
  }
  static Future<bool?> setPrefs({
  required String key,
    required String value,
})async{
     return  await sharedPreferences?.setString(key, value);


  }
   static String? getPrefs({required String key}){
    return sharedPreferences?.getString(key);
  }
}