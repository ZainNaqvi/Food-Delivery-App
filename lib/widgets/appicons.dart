import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget AppIcons({
  required BuildContext context,
  Color backgrounColor = Colors.grey,
  IconData iconData = Icons.remove,
  Color iconColor = Colors.black,
}) {
  return Container(
    width: 44.w,
    height: 44.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: backgrounColor,
    ),
    child: Center(
      child: Icon(
        iconData,
        color: iconColor,
      ),
    ),
  );
}
