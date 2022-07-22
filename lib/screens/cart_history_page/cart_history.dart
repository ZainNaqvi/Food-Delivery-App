import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
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
    var listCounter = 0;
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
              margin: EdgeInsets.only(top: 34.h, left: 12.w, right: 12.w),
              width: double.maxFinite,
              child: ListView(
                children: [
                  for (int i = 0; i < cartItemsPerOrder.length; i++)
                    Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "05/56/5/6/56/",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                      cartItemsPerOrder[i] != null
                                          ? cartItemsPerOrder[i]!
                                          : 4, (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return Container(
                                      height: 80.h,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  AppConstants.APP_BASEURL +
                                                      "/uploads/" +
                                                      getCartHistoryList[
                                                              listCounter - 1]
                                                          .img!))),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ]),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
