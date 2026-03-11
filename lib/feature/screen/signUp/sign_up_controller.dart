import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/utils.dart';

class SignUpController extends GetxController {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isRegisterProgress = false.obs;


  void submitButton() {
    if (key.currentState!.validate()) {
      registerUser();
    }
  }

  //call api
  Future<void> registerUser() async {
    final data = {
      "email": emailController.text.trim(),
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileController.text.trim(),
      "password": passwordController.text,
      "photo": ""
    };
    isRegisterProgress.value = true;
    NetworkResponses networkResponses = await NetworkCaller.postRequest(
        url: Urls.createUser, body:data);
    isRegisterProgress.value= false;
    if(networkResponses.isSuccess){
      Get.snackbar(
        "Title",
        "SuccessFull register",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.toNamed(AppPages.homeView);
    }else{
      Get.snackbar(
        "Title",
        "error message",
        snackPosition: SnackPosition.BOTTOM,
      );
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