

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs
{
  static late final SharedPreferences _prefs;
  static init()async{
    _prefs=await SharedPreferences.getInstance();
  }

  static setLightMode(bool isLightMode)async{
   await _prefs.setBool("theme_mode", isLightMode);
  }
  static bool isLightMode(){
   return _prefs.getBool("theme_mode")??false;
  }
}