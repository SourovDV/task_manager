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
          child: Form(
              key: controller.key,
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text(context.localization.joinWithUp,style: theme.titleLarge,),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.emailController,
                  validator: controller.emailValidator,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "First Name",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.firstNameController,
                  validator: controller.firstNameValidator,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Last Name",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.lastNameController,
                  validator: controller.lastNameValidator,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Mobile",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.mobileController,
                  validator: controller.phoneValidator,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passwordController,
                  validator: controller.passwordValidator,
                ),
                SizedBox(height: 20,),
                Obx((){
                   return Visibility(
                       visible: controller.registerLoading.value == false,
                       replacement: Center(child: CircularProgressIndicator(),),
                       child: CommonButton(child:()=>controller.submitButton()));
                }),
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
            ),
          )),
        ),)
    );
  }
}
