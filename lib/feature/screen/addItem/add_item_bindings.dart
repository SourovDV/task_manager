import 'package:get/get.dart';
import 'package:task_manager/feature/screen/addItem/add_item_controller.dart';

class AddItemBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AddItemController());
  }

}