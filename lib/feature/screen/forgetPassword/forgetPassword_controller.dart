import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class ForgetPasswordController extends GetxController{
  void moveToPinVerificationView(){
    Get.toNamed(AppPages.pinVerification);
  }
}