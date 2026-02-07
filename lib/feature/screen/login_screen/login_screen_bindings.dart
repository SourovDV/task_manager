import 'package:get/get.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_controller.dart';

class LoginScreenBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginScreenController());
  }

}