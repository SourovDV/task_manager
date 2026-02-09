import 'package:get/get.dart';
import 'package:task_manager/feature/screen/profile/profile_controller.dart';

class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }

}