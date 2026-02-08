import 'package:get/get.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_controller.dart';

class CancelBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(CancelledController());
  }

}