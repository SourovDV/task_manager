import 'package:get/get.dart';
import 'package:task_manager/feature/screen/completed/completed_controller.dart';

class CompletedBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(CompletedController());
  }

}