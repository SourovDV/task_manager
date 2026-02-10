import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/controller/authController.dart';

class SplashController extends GetxController{

  Future<void> moveToHomeScreen ()async{
    Future.delayed(Duration(seconds: 10));
    bool? loginToken =await AuthController.isLoggedIn();
    if(loginToken){
      Get.toNamed(AppPages.homeView);
    }else{
    Get.toNamed(AppPages.loginScreen);
    }
  }
  @override
  void onReady() {
    moveToHomeScreen();
    super.onReady();
  }
}