
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

enum AppTheme { Dark, Light }

final Map<AppTheme, ThemeData> appThemeData = {
  // Dark Theme
  AppTheme.Dark: ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      fillColor: kLightPlaceholder,
      contentPadding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      iconColor: Colors.black,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    canvasColor: kDarkBackground,
    cardColor: kDarkCardColor,
    primaryColor: kDarkPrimary,
    buttonColor: kDarkCardColor,
    accentColor: Colors.black,
    scaffoldBackgroundColor: kDarkBackground,
    backgroundColor: kDarkPlaceholder,
    errorColor: kDarkError,
    cursorColor: kDarkCardColor,
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme().copyWith(
        caption: TextStyle(color: Colors.white),
        headline1: TextStyle(
          fontSize: 38.sp,
          color: kDarkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 30.sp,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        headline3: TextStyle(
          fontSize: 22.sp,
          color: Color(0xFF191923),
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 22.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          fontSize: 12.sp,
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          fontSize: 12.sp,
          color: kDarkTextColor,
          height: 2.5,
        ),
        subtitle1: TextStyle(
          fontSize: 16.sp,
          color: kDarkTextColor,
          height: 2.5,
        ),
        subtitle2: TextStyle(
          color: kLightTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kDarkBackground,
      selectedItemColor: kDarkPrimary,
      selectedIconTheme: IconThemeData(
        color: kDarkPrimary,
        size: 24.sp,
      ),
      unselectedItemColor: kDarkPlaceholderText,
      unselectedIconTheme: IconThemeData(
        color: kDarkPlaceholderText,
        size: 24.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkBackground,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(
        color: kDarkTextColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      refreshBackgroundColor: kDarkPlaceholder,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      background: kDarkPlaceholder,
      surface: kDarkPlaceholderText,
      primary: kDarkPrimary,
      secondary: kDarkAccent,
    ),
  ),
  // Light Theme
  AppTheme.Light: ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      // ignore: prefer_const_constructors
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      fillColor: kLightPlaceholder,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
    ),
    cardColor: Colors.white,
    buttonColor: Colors.grey[300],
    accentColor: Colors.black,
    cursorColor: Colors.teal,
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kLightBackground,
    backgroundColor: kLightPlaceholder,
    errorColor: kLightError,
    textTheme: GoogleFonts.openSansTextTheme(
      const TextTheme().copyWith(
        caption: TextStyle(color: Colors.black),
        headline1: TextStyle(
          fontSize: 38.sp,
          color: kLightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 30.sp,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        headline3: TextStyle(
          fontSize: 22.sp,
          color: Color(0xFF191923),
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 22.sp,
          color: kMediumTextColor,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          fontSize: 12.sp,
          color: kLightSmallTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 14.sp,
          color: kLightTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 12.sp,
          color: kLightTextColor,
        ),
        subtitle1: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          height: 2.5,
        ),
        subtitle2: TextStyle(
          color: kDarkTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 56.h),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
          kDarkTextColor,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kLightPrimary),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kLightPrimary,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kLightPrimary,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kLightBackground,
      selectedItemColor: kLightPrimary,
      selectedIconTheme: IconThemeData(
        color: kLightPrimary,
        size: 24.sp,
      ),
      unselectedItemColor: kLightPlaceholderText,
      unselectedIconTheme: IconThemeData(
        color: kLightPlaceholderText,
        size: 24.sp,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      refreshBackgroundColor: kLightPlaceholder,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: kLightPlaceholder,
      surface: kLightPlaceholderText,
      primary: kLightPrimary,
      secondary: kLightAccent,
    ),
  )
};
