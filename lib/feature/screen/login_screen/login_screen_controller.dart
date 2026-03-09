import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class LoginScreenController extends GetxController{
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;

  //submit button
  void submitLoginUserData(){
    if(loginKey.currentState!.validate()){
      Get.toNamed(AppPages.homeView);
      // clearFields();
    }
  }
//api calling

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