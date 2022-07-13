import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Positioned headerAppIcon(BuildContext context) {
  return Positioned(
    left: 20.w,
    right: 20.w,
    top: 45.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.only(left: 8.w),
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Center(
            child: Icon(
              Icons.add_shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
