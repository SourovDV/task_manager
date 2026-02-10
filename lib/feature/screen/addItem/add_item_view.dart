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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
               SizedBox(height: 80,),
                Text(context.localization.addNewTask,style: theme.titleLarge,),
                SizedBox(height: 10,),
                TextFormField(decoration: InputDecoration(hintText: "Subject")),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                SizedBox(height: 20,),
                CommonButton(child:(){} )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
