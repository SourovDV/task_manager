import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class ProfileController extends GetxController{
  void moveToLogin(){
    Get.offNamed(AppPages.loginScreen);
  }
}