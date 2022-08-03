import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_constants.dart';

Positioned header(String img) {
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
          image: NetworkImage(AppConstants.APP_BASEURL + "/uploads/" + img),
        ),
      ),
    ),
  );
}
