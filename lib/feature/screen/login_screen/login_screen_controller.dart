import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class LoginScreenController extends GetxController{
  void moveToForgetPasswordViewPage(){
    Get.toNamed(AppPages.forgetPassword);
  }

  void moveToSignUpScreenView (){
    Get.toNamed(AppPages.signUp);
  }

  void moveToHomeViewPage(){
    Get.offNamed(AppPages.homeView);
  }
}