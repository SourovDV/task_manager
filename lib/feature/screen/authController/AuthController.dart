
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/model/userModel.dart';

class AuthController{
  static String? access_token;
  static UserModel ? user_model;
  static Future<void> saveData(String token, UserModel ? model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("access-token",token);
    sharedPreferences.setString("user-model",jsonEncode(model!.toJson()));
  }

  static Future<void> getData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ?token = sharedPreferences.getString("access-token");
    String ? model = sharedPreferences.getString("user-model");
    
    access_token = token;
    user_model = UserModel.formJson(jsonDecode(model!));
    
  }

  static Future<void> logOut()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<bool> isLoogedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
     String ?token = sharedPreferences.getString("access-token");
     return token != null;
  }

}