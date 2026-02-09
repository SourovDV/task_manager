import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
          padding: const EdgeInsets.all(40.0),
          child: Form(child: Column(
            children: [
              SizedBox(height: 150,),
              Text(context.localization.pinVerification,style: theme.titleLarge,),
              SizedBox(height: 8,),
              Text(context.localization.a6DigitVerificationPinWillSendToYourEmailAddress,style: theme.titleMedium,),
              SizedBox(height: 20,),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.white,
                ),

                backgroundColor: Colors.transparent,
                enableActiveFill: true,

                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                }, appContext: context,
              ),
              SizedBox(height: 20,),
              CommonButton(child: ()=>controller.moveToSetPassword(),),
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
