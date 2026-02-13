import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/controller/authController.dart';
import 'package:task_manager/feature/data/model/user_model.dart';
import 'package:task_manager/feature/data/services/network_caller.dart';
import 'package:task_manager/feature/data/utils/urls.dart';

class LoginScreenController extends GetxController{
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;
  //email validator
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
  //password validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least 1 capital letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least 1 number';
    }
    return null;
  }
  //submit button
  void submitLoginUserData(){
    if(loginKey.currentState!.validate()){
      loginUser();
      // clearFields();
    }
  }
//api calling
  Future<void> loginUser()async{
    loginLoading.value = true;
    Map<String,dynamic> registerData={
      "email":emailController.text.trim(),
      "password":passwordController.text
    };
    NetworkResponse response = await NetworkCaller.postRequest(url: Urls.login,data: registerData);
    loginLoading.value = false;
    if(response.isSuccess){
      final token = response.responseData!["token"];
      final model = UserModel.fromJson(response.responseData!["data"]);
      await AuthController.saveData(token, model);
      Get.snackbar(
        'Success',
        'Account created successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 2),
      );
      Get.offNamed(AppPages.homeView);
    }else{
      Get.snackbar(
        'false',
        'Account created successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 2),
      );

    }

  }

void clearFields(){
    emailController.clear();
    passwordController.clear();
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