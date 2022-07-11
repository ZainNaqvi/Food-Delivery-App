import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row productText(BuildContext context) {
  return Row(
    children: [
      Text("Popular", style: Theme.of(context).textTheme.headline4),
      SizedBox(
        width: 22.w,
      ),
      Text(
        "Food pairing",
        style: Theme.of(context).textTheme.headline6,
      )
    ],
  );
}
