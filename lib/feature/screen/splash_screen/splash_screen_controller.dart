import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';

class SplashController extends GetxController{

  Future<void> moveToHomeScreen ()async{
    Future.delayed(Duration(seconds: 10));
    Get.toNamed(AppPages.loginScreen);
  }
  @override
  void onReady() {
    moveToHomeScreen();
    super.onReady();
  }
}