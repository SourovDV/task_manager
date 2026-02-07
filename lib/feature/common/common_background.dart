import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/app/asset_path.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Stack(
       children: [
         SvgPicture.asset(AssetPath.backgroundImage),
         Center(child: child)
       ],
     ),
   );
  }
}
