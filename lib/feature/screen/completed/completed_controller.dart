import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/feature/data/model/task_count_by_list.dart';
import 'package:task_manager/feature/data/services/network_caller.dart';
import 'package:task_manager/feature/data/utils/urls.dart';

class CompletedController extends GetxController{

  Rxn<TaskCountByList> taskCountByList = Rxn<TaskCountByList>();

  //complete data show
  Future<void> completedData()async{
    NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskCountById("Completed"));
    if(response.isSuccess){
      taskCountByList.value = TaskCountByList.fromJson(response.responseData!);
    }else{
      Get.snackbar("error", "not found");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    completedData();
  }
}