import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/context_extension.dart';
import 'package:task_manager/feature/common/commonButton.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/screen/pinVerification/pin_verification_controller.dart';

class PinVerificationView extends GetView<PinVerificationController> {
  const PinVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CommonBackground(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(child: Column(
            children: [
              SizedBox(height: 250,),
              Text(context.localization.yourEmailAddress,style: theme.titleLarge,),
              SizedBox(height: 8,),
              Text(context.localization.a6DigitVerificationPinWillSendToYourEmailAddress,style: theme.titleMedium,),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 20,),
              CommonButton(child: (){},),
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
