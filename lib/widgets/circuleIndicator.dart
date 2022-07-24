import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 84.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: Colors.teal,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
