import 'package:get/get.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_controller.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}