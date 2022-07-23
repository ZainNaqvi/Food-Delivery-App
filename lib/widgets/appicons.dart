import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget AppIcons({
  required BuildContext context,
  Color backgrounColor = Colors.grey,
  IconData iconData = Icons.remove,
  Color iconColor = Colors.black,
  double size = 24.0,
  double width = 44,
  double height = 44,
}) {
  return Container(
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: backgrounColor,
    ),
    child: Center(
      child: Icon(
        size: size,
        iconData,
        color: iconColor,
        
      ),
    ),
  );
}
