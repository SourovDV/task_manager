import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/asset_path.dart';
import 'package:task_manager/feature/common/common_background.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(child: Center(child: SvgPicture.asset(AssetPath.logo))),
    );
  }
}
