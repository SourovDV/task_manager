import 'package:get/get.dart';
import 'package:task_manager/feature/screen/progress/progress_controller.dart';

class ProgressBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProgressController());
  }

}