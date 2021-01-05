import 'dart:convert';

import 'package:firebase_demo/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession{
  static bool isLoggedIn=false;
  static SharedPreferences sharedPreferences;
  static storeSession(UserDetails userDetails) async {
    isLoggedIn = true;
    sharedPreferences = await SharedPreferences.getInstance();
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("USER", json.encode(userDetails.toMap()));
  }
  static Future<UserDetails> getSession() async{
    sharedPreferences = await SharedPreferences.getInstance();

    var user = jsonDecode(sharedPreferences.getString("USER"));

    print( UserDetails().fromMap(user).firstname);

    print("User Session: ----------->");
   // print(user);
    return  UserDetails().fromMap(user);
  }
  static clearSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    isLoggedIn = false;
  }
}