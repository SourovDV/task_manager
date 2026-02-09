import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/data/services/network_caller.dart';
import 'package:task_manager/feature/data/utils/urls.dart';

class SignUpController extends GetxController{

  final key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  RxBool registerLoading = false.obs;
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
  // phone validator
  String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^(01)[3-9]\d{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
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
  //last name validator
  String? lastNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Last name is required';
    }
    return null;
  }
  //firstname validator
  String? firstNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'First name is required';
    }
    if (value.length < 2) {
      return 'First name must be at least 2 characters';
    }
    return null;
  }
  //submit button

  void submitButton(){
    if(key.currentState!.validate()){
    registerUser();
    clearForm();
    }
  }
//post api call

  Future<void> registerUser()async{
    registerLoading.value = true;
    Map<String,dynamic> registerData={
      "email":emailController.text.trim(),
    "firstName":firstNameController.text.trim(),
    "lastName":lastNameController.text.trim(),
    "mobile":mobileController.text.trim(),
    "password":passwordController.text,
    "photo":""
    };
    NetworkResponse response = await NetworkCaller.postRequest(url: Urls.register,data: registerData);
    registerLoading.value = false;
    if(response.isSuccess){
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
      clearForm();
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

  //clear data
   void clearForm(){
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    passwordController.clear();
   }

  void moveToSignInPage(){
    Get.toNamed(AppPages.loginScreen);
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}
