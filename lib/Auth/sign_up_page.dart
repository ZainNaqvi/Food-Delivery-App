import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/customInputField.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _userPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              height: 190.h,
              margin: EdgeInsets.symmetric(vertical: 24.h),
              child: Image.asset("assets/images/splash_1.png")),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                child: Column(
                  children: [
                    customInputTextFormField(
                      controller: _userEmailController,
                      hintText: "Email",
                      iconData: Icons.person_outline,
                    ),
                    SizedBox(height: 12.h),
                    customInputTextFormField(
                      controller: _userPasswordController,
                      hintText: "Password",
                      iconData: Icons.password_sharp,
                    ),
                    SizedBox(height: 12.h),
                    customInputTextFormField(
                      controller: _userNameController,
                      hintText: "Name",
                      iconData: Icons.person,
                    ),
                    SizedBox(height: 12.h),
                    customInputTextFormField(
                      controller: _userPhoneController,
                      hintText: "Phone",
                      iconData: Icons.phone_outlined,
                    ),
                    SizedBox(height: 22.h),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.teal,
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => null,
                          text: "Sign up using one of the following methods",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
