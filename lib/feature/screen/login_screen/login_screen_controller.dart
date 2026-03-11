import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/utils.dart';
import 'package:task_manager/feature/screen/auth_controller/auth_controller.dart';

class LoginScreenController extends GetxController{
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;

  //submit button
  void submitLoginUserData(){
    if(loginKey.currentState!.validate()){
      moveToNextPage();
      // clearFields();
    }
  }
//api calling

  Future<void> moveToNextPage()async{
    NetworkResponses networkResponses =await NetworkCaller.postRequest(url: Urls.loginUser,body: {
      "email":emailController.text,
      "password":passwordController.text
    });
    if(networkResponses.isSuccess){
     String token =await networkResponses.responsData!["token"];
     print("token = $token");
     UserModel model =await UserModel.formJson(networkResponses.responsData!["data"]);
     await AuthController.saveUserData(token,model);
      Get.snackbar(
        "Title",
        "Login Successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.toNamed(AppPages.homeView);
    }else{
      Get.snackbar(
        "Title",
        "login false",
        snackPosition: SnackPosition.BOTTOM,
      );
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