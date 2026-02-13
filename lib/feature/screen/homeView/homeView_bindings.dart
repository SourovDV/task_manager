import 'package:get/get.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_controller.dart';
import 'package:task_manager/feature/screen/completed/completed_controller.dart';
import 'package:task_manager/feature/screen/homeView/homeView_controller.dart';
import 'package:task_manager/feature/screen/new/new_controller.dart';
import 'package:task_manager/feature/screen/progress/progress_controller.dart';

class HomeViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewController());
    Get.lazyPut(() => NewController());
    Get.lazyPut(() => CompletedController());
    Get.lazyPut(() => CancelledController());
    Get.lazyPut(() => ProgressController());
  }

}