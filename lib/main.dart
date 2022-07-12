import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/screens/productDetail/popularProducts.dart';
import 'package:food_delivery_application/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          darkTheme: appThemeData[AppTheme.Dark],
          theme: appThemeData[AppTheme.Light],
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery Application || Flutter Firebase || Flutter',
          // You can use the library anywhere in the app even in theme

          home: child,
        );
      },
      child: PopularProductPage(),
    );
  }
}
