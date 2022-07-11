import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dotIndicator({required double currentPageValue}) {
  return Container(
    margin: EdgeInsets.only(top: 16.h, bottom: 12.h),
    child: DotsIndicator(
      dotsCount: 5,
      position: currentPageValue,
      decorator: DotsDecorator(
        activeColor: Colors.teal,
        // size: const Size.square(9.0),
        // activeSize: const Size(18.0, 9.0),
        activeShape: CircleBorder(),
      ),
    ),
  );
}
