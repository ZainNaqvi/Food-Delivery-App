import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/constants.dart';

Widget header(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pakistan",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              children: [
                Text(
                  "Wah Cantt",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: kLightTextColor,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
