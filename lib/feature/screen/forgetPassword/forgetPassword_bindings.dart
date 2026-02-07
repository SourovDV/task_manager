import 'package:get/get.dart';
import 'package:task_manager/feature/screen/forgetPassword/forgetPassword_controller.dart';

class ForgetBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ForgetPasswordController());
  }

}