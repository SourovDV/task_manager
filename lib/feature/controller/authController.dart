import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/feature/data/model/user_model.dart';

class AuthController{
  static Future<void> saveData(String token, UserModel model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("token",token);
    sharedPreferences.setString("model",jsonEncode(model.toJson()));
  }
}