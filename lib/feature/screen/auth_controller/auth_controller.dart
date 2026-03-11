import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/user_model.dart';
class AuthController{
  static String ? userToken;
  static UserModel ? userData;
  static Future<void> saveUserData(String token , UserModel? model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("access-token", token);
    sharedPreferences.setString("user-data", jsonEncode(model!.toJson()));
  }
  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("access-token");
    String? model =  sharedPreferences.getString("user-data");

    userToken = token;
    userData = UserModel.formJson(jsonDecode(model!));
  }

  static Future<bool> isLoggedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString("access-token");
    if(token !=null){
      getUserData();
      return true;
    }else{
      return false;
    }
  }

  static Future<void> logOut()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}