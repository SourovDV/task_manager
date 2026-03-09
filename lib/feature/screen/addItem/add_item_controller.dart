import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/new/new_controller.dart';

class AddItemController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final addItemKey = GlobalKey<FormState>();
  final NewController newController = Get.find<NewController>();

  RxBool addItemLoading = false.obs;

  void submitAddItem() {
    if (addItemKey.currentState!.validate()) {

    }
  }
  String? subjectAndDescriptionValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  void moveToProfilePage() {
    Get.toNamed(AppPages.profile);
  }

  void moveToLogin() {
    Get.offNamed(AppPages.loginScreen);
  }

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
