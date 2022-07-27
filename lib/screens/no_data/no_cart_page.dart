import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Auth/sign_in_page.dart';

class NoData extends StatelessWidget {
  final String text;
  final String imageData;
  final bool yes;
  const NoData({
    Key? key,
    this.imageData = 'assets/images/no-data.png',
    required this.text,
    this.yes = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 0.h),
          Column(
            children: [
              Image.asset(
                imageData,
                width: MediaQuery.of(context).size.height * 0.44,
              ),
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.h),
          yes ? SizedBox(height: 0.h) : SizedBox(height: 8.h),
          yes
              ? Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 38.w, vertical: 24.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        Signin(),
                        transition: Transition.leftToRightWithFade,
                      );
                    },
                    child: Container(
                      width: 100.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
