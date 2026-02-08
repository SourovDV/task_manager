import 'package:flutter/material.dart';
import 'package:task_manager/app/appColor.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.greenColor,
      title: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("sourov",style: TextStyle(fontSize: 18),),
              Text("sourov@gmail.com",style: TextStyle(fontSize: 16),)
            ],
          ),
          Spacer(),
          Icon(Icons.logout),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
