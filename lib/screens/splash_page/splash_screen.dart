import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  _loadData() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward();

    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(
      Duration(seconds: 4),
      () => Get.toNamed(AppRoutes.initial),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset(
              "assets/images/splash_1.png",
              width: double.maxFinite,
              height: 150.h,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "The Best Food",
          style: TextStyle(
            fontSize: 38.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "cursive",
            color: Colors.brown,
          ),
        ),
      ]),
    );
  }
}
