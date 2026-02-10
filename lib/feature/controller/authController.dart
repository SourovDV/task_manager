import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/feature/data/model/user_model.dart';

class AuthController{
  static String ? accessToken;
  static UserModel ? accessModel;

  static Future<void> saveData(String token, UserModel model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("token",token);
    sharedPreferences.setString("model",jsonEncode(model.toJson()));
  }

  static Future<bool> isLoggedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    if(token!=null){
      await saveUserdata();
      return true;
    }else{
      return false;
    }
  }

  static Future<void> saveUserdata()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString("token");
    String ? userData = sharedPreferences.getString("model");
    accessToken = token;
    accessModel = UserModel.fromJson(jsonDecode(userData!));
  }

  static Future<void> clearData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}