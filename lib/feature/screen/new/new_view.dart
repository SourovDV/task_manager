import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/feature/common/statusCard.dart';
import 'package:task_manager/feature/common/task_card.dart';
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
              /// Top Status Cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    StatusCard(title: "Cancelled", count: "09"),
                    SizedBox(width: 5,),
                    StatusCard(title: "Completed", count: "09"),
                    SizedBox(width: 5,),
                    StatusCard(title: "Progress", count: "09"),
                    SizedBox(width: 5,),
                    StatusCard(title: "New Task", count: "09"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //task List
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                    return Column(
                      children: const [
                        TaskCard(text: "New",color: Colors.cyan,),
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

