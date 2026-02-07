import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class PinVerificationController extends GetxController{
  void moveToSetPassword(){
    Get.toNamed(AppPages.setPassword);
  }

}