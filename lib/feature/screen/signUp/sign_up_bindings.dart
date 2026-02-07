import 'package:get/get.dart';
import 'package:task_manager/feature/screen/signUp/sign_up_controller.dart';

class SignUpBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignUpController());
  }

}