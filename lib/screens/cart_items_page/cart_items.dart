import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/widgets/appicons.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              top: 18.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcons(
                    context: context,
                    iconData: Icons.arrow_back_ios,
                    backgrounColor: Colors.teal,
                    iconColor: Colors.white,
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  AppIcons(
                    context: context,
                    iconData: Icons.home_outlined,
                    backgrounColor: Colors.teal,
                    iconColor: Colors.white,
                  ),
                  AppIcons(
                    context: context,
                    iconData: Icons.shopping_cart,
                    backgrounColor: Colors.teal,
                    iconColor: Colors.white,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
