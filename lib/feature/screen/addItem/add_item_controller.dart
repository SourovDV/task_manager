import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class AddItemController extends GetxController{
  void moveToProfilePage(){
    Get.toNamed(AppPages.profile);
  }

  void moveToLogin(){
    Get.offNamed(AppPages.loginScreen);
  }
}