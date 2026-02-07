import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key,   required this.child});
  final VoidCallback child;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 55,
      child: InkWell(
        onTap: child,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF22B573),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {},
          child: const Icon(Icons.arrow_forward,color: Colors.white,),
        ),
      ),
    );
  }
}
