import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class KvStorage {

  static Future<int> getInt(String k) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(k);
  }
  static Future<String> getString(String k) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(k);
  }

  static void setString(String k,String v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(k, v);
  }

  static void setInt(String k,int v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(k, v);
  }

}

