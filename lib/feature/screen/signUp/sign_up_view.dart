import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/screen/signUp/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CommonBackground(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(child: Column(
            children: [
              SizedBox(height: 250,),
              Text(context.localization.joinWithUp,style: theme.titleLarge,),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "First Name",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Last Name",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Mobile",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
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
                  Text(context.localization.signIn,style: theme.titleSmall,)
                ],
              )
            ],
          )),
        ),)
    );
  }
}
