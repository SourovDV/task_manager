import 'package:get/get.dart';
import 'package:task_manager/feature/screen/new/new_controller.dart';

class NewBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NewController());
  }

}