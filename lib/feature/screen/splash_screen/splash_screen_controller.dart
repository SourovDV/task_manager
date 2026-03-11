import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/auth_controller/auth_controller.dart';
class SplashController extends GetxController{

  Future<void> moveToHomeScreen ()async{
    Future.delayed(Duration(seconds: 10));
    bool token =await AuthController.isLoggedIn();
    if(token){
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