import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_view.dart';
import 'package:task_manager/feature/screen/completed/completed_view.dart';
import 'package:task_manager/feature/screen/new/new_view.dart';
import 'package:task_manager/feature/screen/progress/progress_view.dart';

import '../../data/utils/urls.dart';

class HomeViewController extends GetxController{
    RxInt currentPageIndex = 0.obs;
     final List items = [
      NewView(),
      CompletedView(),
      CancelledView(),
      ProgressView(),
    ];

    Future<void> deleteRequest(String id)async{
      NetworkResponses networkResponses =await NetworkCaller.postRequest(url:Urls.deleteData(id));
      if(networkResponses.isSuccess){
        Get.snackbar("title", "delete success");
        Get.toNamed(AppPages.loginScreen);
      }else{
        Get.snackbar("title", "Sorry not deleted");
      }
    }

     void moveToAddItemViewPage(){
       Get.toNamed(AppPages.addItem);
     }

     void moveToProfilePage(){
       Get.toNamed(AppPages.profile);
     }
     void moveToLoginScreen(){
       Get.offNamed(AppPages.loginScreen);
     }
}