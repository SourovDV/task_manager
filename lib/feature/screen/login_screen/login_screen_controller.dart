import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/model/userModel.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils.dart';
import 'package:task_manager/feature/screen/authController/AuthController.dart';


class LoginScreenController extends GetxController{
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;

  //submit button
  void submitLoginUserData(){
    if(loginKey.currentState!.validate()){
      // clearFields();
      loginUser();
    }
  }

  // post request for log in
  Future<void> loginUser()async{
    NetworkResponces networkResponces =await NetworkCaller.postRequest(url: Urls.loginUser,body: {
      "email":emailController.text,
      "password":passwordController.text
    });
    if(networkResponces.isSuccess){
      String token = networkResponces.responcesData!["token"];
      UserModel model = UserModel.formJson(networkResponces.responcesData!["data"]);
      AuthController.saveData(token, model);

      Get.snackbar("success", "login success");
      Get.toNamed(AppPages.homeView);
    }else{
      Get.snackbar("false", "something wrong");
    }
  }

  void moveToForgetPasswordViewPage(){
    Get.toNamed(AppPages.forgetPassword);
  }

  void moveToSignUpScreenView (){
    Get.toNamed(AppPages.signUp);
  }

  void moveToHomeViewPage(){
    Get.offNamed(AppPages.homeView);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}