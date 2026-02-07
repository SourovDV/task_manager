import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class ForgetPasswordController extends GetxController{
  void moveToPinVerificationView(){
    print("sdfs");
    Get.toNamed(AppPages.pinVerification);
    print("sdfs");
  }
}