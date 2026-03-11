import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/model/task_status_count_model.dart';
import 'package:task_manager/data/model/task_status_model.dart';
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
             Obx(()=> SizedBox(
               height: 110,
               child:  ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount:controller.taskStatusCount.value?.data?.length ?? 2,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding:
                     const EdgeInsets.only(right: 10),
                     child: StatusCard(
                       title: "${controller.taskStatusCount.value?.data?[index].sum ?? "sourov"}",
                       count:"${controller.taskStatusCount.value?.data?[index].sId ?? 5}",
                     ),
                   );
                 },
               ),
             ),),
              const SizedBox(height: 20),
              /// 🔹 Bottom New Task List (Second API)
              Expanded(
                child:ListView.builder(

                  itemCount:2,
                  itemBuilder: (context, index) {
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
                          Text("214",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 6),

                          /// Description
                          Text(
                            "154",
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

                                  },
                                  child: Icon(Icons.delete, color: Colors.red)),
                            ],
                          ),
                        ],
                      ),
                    );;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


