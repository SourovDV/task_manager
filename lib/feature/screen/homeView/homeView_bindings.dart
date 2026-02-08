import 'package:get/get.dart';
import 'package:task_manager/feature/screen/homeView/homeView_controller.dart';

class HomeViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewController());
  }

}