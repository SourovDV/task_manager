import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/data/services/network_caller.dart';
import 'package:task_manager/feature/data/utils/urls.dart';

class AddItemController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final addItemKey = GlobalKey<FormState>();
  RxBool addItemLoading = false.obs;

  void submitAddItem() {
    if (addItemKey.currentState!.validate()) {
      userDataAdded();
    }
  }

  //api calling
  Future<void> userDataAdded() async {

    Map<String, dynamic> dataBody = {
      "title": subjectController.text.trim(),
      "description": subjectController.text.trim(),
      "status": "New",
    };
    addItemLoading.value = true;
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createData,
      data: dataBody,
    );
    addItemLoading.value = false;
    if(response.isSuccess){
      Get.toNamed(AppPages.homeView);
      Get.snackbar(
        'Success',
        'Item Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 2),
      );
    }else{
      Get.snackbar(
        'false',
        'wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 2),
      );
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
