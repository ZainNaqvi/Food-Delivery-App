import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/Auth/sign_up_page.dart';
import 'package:food_delivery_application/screens/mainpage.dart';
import 'package:food_delivery_application/server/firebase_auth/firebase_auth.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';
import 'package:get/get.dart';

import '../controllers/getuserData.dart';
import '../widgets/customInputField.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _userEmailController = TextEditingController();

  final _userPasswordController = TextEditingController();

  bool isLoading = false;

  regesterUser() async {
    final email = _userEmailController.text.trim();
    final password = _userPasswordController.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Message", "Type in your email.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (password.isEmpty) {
      Get.snackbar("Message", "Type in your password.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (!GetUtils.isEmail(email)) {
      Get.snackbar("Message", "Type a valid email address.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (password.length < 6) {
      Get.snackbar("Message", "Password must at least 6 digits.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else {
      setState(() {
        isLoading = true;
      });
      String res = await AuthUser().userLogin(
        email: email,
        password: password,
      );
      if (res == 'success') {
        Get.snackbar("Message", res);
        setState(() {
          isLoading = false;
        });
        await Get.find<GetUserData>().getUserData();
        Get.to(
          MainPage(),
          transition: Transition.cupertinoDialog,
        );
      } else {
        Get.snackbar("Message", res);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 190.h,
            margin: EdgeInsets.symmetric(vertical: 24.h),
            child: Image.asset("assets/images/splash_1.png"),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 54.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Sign in to your account",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sign in to your account",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    isLoading
                        ? CircleIndicator()
                        : GestureDetector(
                            onTap: () {
                              regesterUser();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: Colors.teal,
                              ),
                              child: Center(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          SignUp(),
                          transition: Transition.leftToRightWithFade,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Create",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
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
