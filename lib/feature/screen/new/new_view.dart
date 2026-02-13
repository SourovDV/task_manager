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
                    controller.taskByStatusCount.value?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =
                      controller.taskByStatusCount.value!.data![index];

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
              Expanded(
                child: Obx(() {
                  if (controller.taskListProgress.value) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                
                  return ListView.builder(
                   
                    itemCount: controller.taskCountByList.value?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =
                      controller.taskCountByList.value!.data![index];
                
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// Title
                            Text("${item.title}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 6),

                            /// Description
                            Text(
                              "${item.description}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// Date
                            Text(
                              "Date: 24541",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// Bottom Row
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "New",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                ),

                                const Spacer(),

                                Icon(Icons.edit, color: Colors.green),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap:(){
                                    controller.deletedData(item.sId.toString());
                                    print(item.sId);
                                  },
                                    child: Icon(Icons.delete, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      );;
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


