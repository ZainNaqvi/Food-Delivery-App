import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartProductController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();
    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8.h),
            width: double.maxFinite,
            height: 70.h,
            decoration: BoxDecoration(color: Colors.teal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Your cart history",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                ),
                AppIcons(
                    backgrounColor: Colors.white,
                    iconColor: Colors.teal,
                    context: context,
                    iconData: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w),
              width: double.maxFinite,
              child: ListView(
                children: [
                  for (int i = 0; i <= 10; i++) Text("HIther"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
