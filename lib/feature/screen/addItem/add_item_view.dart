import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_appbar.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/controller/authController.dart';
import 'package:task_manager/feature/screen/addItem/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context).textTheme;
    return Scaffold(
      appBar: CommonAppBar(child: controller.moveToProfilePage,secondChild: ()async{
        await AuthController.clearData();
        controller.moveToLogin();
      }),
      body: CommonBackground(
        child: Form(
          key: controller.addItemKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 SizedBox(height: 80,),
                  Text(context.localization.addNewTask,style: theme.titleLarge,),
                  SizedBox(height: 10,),
                  TextFormField(decoration: InputDecoration(hintText: "Subject"),
                  controller: controller.subjectController,
                   validator: controller.subjectAndDescriptionValidate,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(hintText: "Description"),
                    controller: controller.descriptionController,
                    validator: controller.subjectAndDescriptionValidate,
                  ),
                  SizedBox(height: 20,),
               Obx((){
                 return  Visibility(
                   visible: controller.addItemLoading.value == false,
                   replacement: Center(
                     child: CircularProgressIndicator(),
                   ),
                   child: CommonButton(child:(){
                     controller.submitAddItem();
                   } ),
                 );
               })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
