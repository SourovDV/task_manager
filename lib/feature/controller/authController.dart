import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/feature/data/model/user_model.dart';

class AuthController{
  static String ? accessToken;
  static UserModel ? accessModel;

  static const String _userToken = "token";
  static const String _userModel = "model";

  static Future<void> saveData(String token, UserModel model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString(_userToken,token);
    sharedPreferences.setString(_userModel,jsonEncode(model.toJson()));
  }

  static Future<bool> isLoggedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_userToken);
    if(token!=null){
      await saveUserdata();
      return true;
    }else{
      return false;
    }
  }

  static Future<void> saveUserdata()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString(_userToken);
    String ? userData = sharedPreferences.getString(_userModel);
    accessToken = token;
    accessModel = UserModel.fromJson(jsonDecode(userData!));
  }

  static Future<void> clearData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}