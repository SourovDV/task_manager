import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class SetPasswordController extends GetxController{
  void moveToSignInPage(){
    Get.offNamed(AppPages.loginScreen);
  }
}