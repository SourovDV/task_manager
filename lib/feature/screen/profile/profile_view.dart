import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_appbar.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/controller/authController.dart';
import 'package:task_manager/feature/screen/profile/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar:CommonAppBar(child: (){} ,secondChild: ()async{
        await AuthController.clearData();
        controller.moveToLogin();
      }),
      body:CommonBackground(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(child: Column(
          children: [
            SizedBox(height: 50,),
            Text(context.localization.updateProfile,style: theme.titleLarge,),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(height: 50, width: 80,color: Colors.grey,child: Center(child: Text("Photo"),),),
                Expanded(child: Container(height: 50,color: Colors.white,))
              ],
            ),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "Email"),),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "First Name"),),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "Last Name"),),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "Mobile"),),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "Password"),),
            SizedBox(height: 20,),
            CommonButton(child: (){})
          ]
        ),),
      )
      )
    );
  }
}
