import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/services/network_caller.dart';

class SignUpController extends GetxController {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void submitButton(){
    if(key.currentState!.validate()){

    }
  }

  //call api
  Future<void> registerUser()async{
      NetworkResponses networkResponses =await NetworkCaller.postRequest(url: )
  }

  void moveToHomeScreen(){
    Get.toNamed(AppPages.homeView);
  }
  void moveToSignInPage(){
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