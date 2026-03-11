import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils.dart';

class SignUpController extends GetxController {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isRegisterProgress = false.obs;

  //post api call
  Future<void> registerUser()async{
    isRegisterProgress.value = true;
    NetworkResponces networkResponces =await NetworkCaller.postRequest(url:Urls.registerUser,body: {
      "email":emailController.text,
      "firstName":firstNameController.text,
      "lastName":lastNameController.text,
      "mobile":mobileController.text,
      "password":passwordController.text,
      "photo":""
    });
    isRegisterProgress.value = false;
    if(networkResponces.isSuccess){
      Get.snackbar("success", "Congrats");
      Get.toNamed(AppPages.homeView);
    }else{
      Get.snackbar("false","sorry");
    }
  }

  void submitButton() {
    if (key.currentState!.validate()) {
      registerUser();
    }
  }



  void moveToHomeScreen() {
    Get.toNamed(AppPages.homeView);
  }

  void moveToSignInPage() {
    Get.toNamed(AppPages.loginScreen);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}