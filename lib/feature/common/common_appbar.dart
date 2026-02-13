import 'package:flutter/material.dart';
import 'package:task_manager/app/appColor.dart';
import 'package:task_manager/feature/controller/authController.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key, required this.child, this.secondChild,
  });
  final VoidCallback ? child, secondChild;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.greenColor,
      title: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10,),
          InkWell(
            onTap: child,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AuthController.accessModel?.fullName ??"sourov",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                Text(AuthController.accessModel?.email??"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          Spacer(),
          InkWell(
              onTap: secondChild,
              child: Icon(Icons.logout)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
