import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/feature/common/statusCard.dart';
import 'package:task_manager/feature/screen/new/new_controller.dart';

class NewView extends GetView<NewController> {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔹 Top Horizontal Status Card
              SizedBox(
                height: 110,
                child: Obx(() {
                  if (controller.taskCountProgress.value) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                    controller.taskByStatusCount?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =
                      controller.taskByStatusCount!.data![index];

                      return Padding(
                        padding:
                        const EdgeInsets.only(right: 10),
                        child: StatusCard(
                          title: item.sId ?? "0",
                          count: item.sum.toString(),
                        ),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              /// 🔹 Bottom New Task List (Second API)

            ],
          ),
        ),
      ),
    );
  }
}


