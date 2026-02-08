import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class SignUpController extends GetxController{
  void moveToSignInPage(){
    Get.toNamed(AppPages.loginScreen);
  }
}