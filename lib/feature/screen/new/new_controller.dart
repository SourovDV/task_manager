import 'package:get/get.dart';
import 'package:task_manager/feature/data/model/task_count_status_model.dart';
import 'package:task_manager/feature/data/services/network_caller.dart';
import 'package:task_manager/feature/data/utils/urls.dart';

import '../../data/model/task_count_by_list.dart';

class NewController extends GetxController{
  Rxn<TaskByStatusCount> taskByStatusCount = Rxn<TaskByStatusCount>();
  Rxn<TaskCountByList> taskCountByList = Rxn<TaskCountByList>();

  RxBool taskCountProgress = false.obs;
  RxBool taskListProgress = false.obs;


   //api calling for taskCountByStatus
  Future<void> taskCount()async{
    taskCountProgress.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskCount);
    taskCountProgress.value = false;
    if(response.isSuccess){
      taskByStatusCount.value = TaskByStatusCount.fromJson(response.responseData!);
    }else{
      Get.snackbar("error", "problem");
    }
  }
  // api calling for list
  Future<void> taskCountByData()async{
    NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskCountById("New"));
    if(response.isSuccess){
      taskCountByList.value = TaskCountByList.fromJson(response.responseData!);
    }else{
      Get.snackbar("error", "problems");
    }
  }

  //delete data
  Future<void> deletedData(String id)async{
    NetworkResponse response =await NetworkCaller.getRequest(url: Urls.deleteData(id));
    if(response.isSuccess){
      Get.snackbar("Success", "Task deleted");
      taskCount();
      taskCountByData();
    }else{
      Get.snackbar("context", "error");
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    taskCount();
    taskCountByData();
  }

}