import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: CommonBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Text(
                    context.localization.getStartedWith,
                    style: theme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  TextFormField(decoration: InputDecoration(
                      hintText: "Email"
                  ),
                    controller: controller.emailController,
                    validator: controller.emailValidator,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    controller: controller.passwordController,
                    validator: controller.passwordValidator,
                  ),
                  SizedBox(height: 20),
                 Obx((){
                   return Visibility(
                       visible: controller.loginLoading.value ==false,
                       replacement: Center(child: CircularProgressIndicator(),),
                       child: CommonButton(child: () => controller.submitLoginUserData()));
                 }),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => controller.moveToForgetPasswordViewPage(),
                    child: Text(context.localization.forgetAccount),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.localization.doNotHaveAccount),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () => controller.moveToSignUpScreenView(),
                        child: Text(
                          context.localization.signUp,
                          style: theme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
