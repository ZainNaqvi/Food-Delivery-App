import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Positioned header() {
  return Positioned(
    left: 0,
    right: 0,
    child: Container(
      height: 310.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.teal,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_food_1.jpg'),
        ),
      ),
    ),
  );
}
