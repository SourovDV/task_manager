import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_view.dart';
import 'package:task_manager/feature/screen/completed/completed_view.dart';
import 'package:task_manager/feature/screen/new/new_view.dart';
import 'package:task_manager/feature/screen/progress/progress_view.dart';

class HomeViewController extends GetxController{
    RxInt currentPageIndex = 0.obs;
     final List items = [
      NewView(),
      CompletedView(),
      CancelledView(),
      ProgressView(),
    ];

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