import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/feature/common/task_card.dart';
import 'package:task_manager/feature/screen/progress/progress_controller.dart';
class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              //task List
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return Column(
                        children: const [
                          TaskCard(text: "Progress",color: Colors.grey,),
                          SizedBox(height: 8),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

