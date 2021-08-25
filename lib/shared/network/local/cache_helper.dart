
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences  localStorage = '' as SharedPreferences ;

  static  init () async
  {
    localStorage = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean ({
    required String key,
    required bool value
  }) async
  {
    return await localStorage.setBool(key, value);
  }



  static bool? getBoolean ({
    required String key,
  })
  {
    return  localStorage.getBool(key);
  }


}