import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/Auth/sign_in_page.dart';
import 'package:food_delivery_application/screens/mainpage.dart';
import 'package:food_delivery_application/server/firebase_auth/firebase_auth.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';
import 'package:get/get.dart';

import '../widgets/customInputField.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userEmailController = TextEditingController();

  final _userPasswordController = TextEditingController();

  final _userNameController = TextEditingController();

  final _userPhoneController = TextEditingController();

  // firebase instance
  bool isLoading = false;

  regesterUser() async {
    final name = _userNameController.text.trim();
    final email = _userEmailController.text.trim();
    final password = _userPasswordController.text.trim();
    final phone = _userPhoneController.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Message", "Type in your email.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (password.isEmpty) {
      Get.snackbar("Message", "Type in your password.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (!GetUtils.isEmail(email)) {
      Get.snackbar("Message", "Type a valid email address.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (name.isEmpty) {
      Get.snackbar("Message", "Type in your name.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (password.length < 6) {
      Get.snackbar("Message", "Password must at least 6 digits.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (phone.isEmpty) {
      Get.snackbar("Message", "Type in your phone.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else if (!GetUtils.isPhoneNumber(phone)) {
      Get.snackbar("Message", "Type a valid phone number.",
          backgroundColor: Colors.red.withOpacity(0.2));
    } else {
      setState(() {
        isLoading = true;
      });
      String res = await AuthUser().createUser(
        email: email,
        password: password,
        phone: phone,
        name: name,
      );
      if (res == 'success') {
        Get.snackbar("Message", res);
        setState(() {
          isLoading = false;
        });
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
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 8.h),
                    RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(
                                  Signin(),
                                  transition: Transition.leftToRightWithFade,
                                ),
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
