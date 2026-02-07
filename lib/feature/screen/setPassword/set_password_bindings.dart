import 'package:get/get.dart';
import 'package:task_manager/feature/screen/setPassword/set_password_controller.dart';

class SetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SetPasswordController());
  }

}