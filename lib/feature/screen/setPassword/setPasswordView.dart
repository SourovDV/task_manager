import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/screen/setPassword/set_password_controller.dart';

class SetPasswordView extends GetView<SetPasswordController> {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CommonBackground(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(child: Column(
            children: [
              SizedBox(height: 150,),
              Text(context.localization.setPassword,style: theme.titleLarge,),
              SizedBox(height: 8,),
              Text(context.localization.minimumLengthPassword8CharacterWithLatterAndNumber,style: theme.titleMedium,),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                ),
              ),
              SizedBox(height: 20,),
              CommonButton(child:(){}),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.localization.haveAccount),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: ()=>controller.moveToSignInPage(),
                      child: Text(context.localization.signIn,style: theme.titleSmall,))
                ],
              )
            ],
          )),
        ),)
    );
  }
}
