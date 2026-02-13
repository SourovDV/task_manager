import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_controller.dart';
class CancelledView extends GetView<CancelledController> {
  const CancelledView({super.key});

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
                          TaskCard(text: "Cancelled",color: Colors.red,),
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

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(.05),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          const Text(
            "sdf",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          /// Description
          Text(
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 12),

          /// Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Date + Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: 02/02/2020",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),

              /// Action Icons
              Row(
                children: const [
                  Icon(Icons.edit, color: Colors.green),
                  SizedBox(width: 10),
                  Icon(Icons.delete, color: Colors.red),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

