import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/authController/AuthController.dart';
class SplashController extends GetxController{
  Future<void> moveToHomeScreen ()async{
    Future.delayed(Duration(seconds: 10));

    bool login =await AuthController.isLoogedIn();
    if(login){
      Get.toNamed(AppPages.homeView);
    }else {
      Get.toNamed(AppPages.loginScreen);
    }
  }
  @override
  void onReady() {
    moveToHomeScreen();
    super.onReady();
  }
}