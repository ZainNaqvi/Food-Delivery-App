import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container customInputTextFormField({
  required IconData iconData,
  required TextEditingController? controller,
  required String hintText,
  Color color = Colors.yellow,
  bool readOnly = false,
}) {
  return Container(
    width: double.maxFinite,
    height: 50.h,
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30.r),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Colors.grey.withOpacity(0.2),
          offset: Offset(2, 10),
          spreadRadius: 7,
        ),
      ],
    ),
    child: TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          iconData,
          color: Colors.yellow,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          gapPadding: 1,
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          gapPadding: 1,
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          gapPadding: 1,
        ),
      ),
    ),
  );
}
