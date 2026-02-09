import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/appColor.dart';
import 'package:task_manager/feature/common/common_appbar.dart';
import 'package:task_manager/feature/screen/homeView/homeView_controller.dart';

class HomeViewView extends GetView<HomeViewController> {
  const HomeViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(child: controller.moveToProfilePage,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.moveToAddItemViewPage();
      },backgroundColor: AppColor.greenColor,child: Icon(Icons.add),),
        body: Obx(() => controller.items[controller.currentPageIndex.value]
        ),
      bottomNavigationBar: Obx(()=>NavigationBar(
          onDestinationSelected: (index){
            controller.currentPageIndex.value = index;
          },
          indicatorColor: AppColor.greenColor,
          selectedIndex: controller.currentPageIndex.value,
          destinations: [
            NavigationDestination(icon: Icon(Icons.newspaper_rounded), label:"New"),
            NavigationDestination(icon: Icon(Icons.done), label:"Completed"),
            NavigationDestination(icon: Icon(Icons.cancel), label:"Cancelled"),
            NavigationDestination(icon: Icon(Icons.refresh), label:"Progress"),
          ]),)
    );
  }
}

