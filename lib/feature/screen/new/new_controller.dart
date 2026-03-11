import 'package:get/get.dart';
import 'package:task_manager/data/model/task_status_count_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils.dart';
class NewController extends GetxController{

  Rxn<Task_status_count> taskStatusCount = Rxn<Task_status_count>();
  Future<void> showTaskStatusCount()async{
    NetworkResponces responces =await NetworkCaller.getRequest(url: Urls.task_status_card);
    if(responces.isSuccess){
      taskStatusCount.value = Task_status_count.fromJson(responces.responcesData!);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showTaskStatusCount();
  }

}