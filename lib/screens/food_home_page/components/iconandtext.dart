import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget IconAndTextWidget(
    {required BuildContext context,
    required IconData? iconData,
    required String title,
    required Color iconColor}) {
  return Row(
    children: [
      Icon(
        iconData,
        color: iconColor,
      ),
      SizedBox(
        width: 5.w,
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    ],
  );
}
