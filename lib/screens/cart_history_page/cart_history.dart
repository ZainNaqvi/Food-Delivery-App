import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/models/cart_product_model.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:food_delivery_application/screens/no_data/no_cart_page.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartProductController>()
        .getCartHistoryList()
        .reversed
        .toList();
    Map<String, int> cartItemsPerOrder = {};
    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderItemsTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemPerOrder = cartOrderTimeToList();
    var listCounter = 0;
    Widget timeWidget(int index) {
      var outPutDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var date = DateFormat("MM/dd/yyyy hh:mm a");
        outPutDate = date.format(inputDate);
      }
      return Text(outPutDate, style: Theme.of(context).textTheme.headline5);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16.h),
            width: double.maxFinite,
            height: 80.h,
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
          GetBuilder<CartProductController>(builder: (value) {
            return Expanded(
              child: value.getCartHistoryList().isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: 8.h, left: 4.w, right: 4.w),
                      width: double.maxFinite,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          children: [
                            for (int i = 0; i < cartItemsPerOrder.length; i++)
                              Container(
                                height: 120.h,
                                margin: EdgeInsets.only(
                                    bottom: 8.h, left: 4.w, right: 4.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      timeWidget(listCounter),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                                itemPerOrder[i], (index) {
                                              if (listCounter <
                                                  getCartHistoryList.length) {
                                                // print(cartItemsPerOrder[i]);

                                                listCounter++;
                                              }
                                              return index <= 2
                                                  ? Container(
                                                      height: 80.h,
                                                      width: 80.w,
                                                      margin: EdgeInsets.only(
                                                          right: 8.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r),
                                                          image: DecorationImage(
                                                              image: NetworkImage(AppConstants
                                                                      .APP_BASEURL +
                                                                  "/uploads/" +
                                                                  getCartHistoryList[
                                                                          listCounter -
                                                                              1]
                                                                      .img!))),
                                                    )
                                                  : Container();
                                            }),
                                          ),
                                          Container(
                                            // color: Colors.red,
                                            height: 80.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                                Text(
                                                  itemPerOrder[i].toString() +
                                                      " Items",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.teal,
                                                          style: BorderStyle
                                                              .solid)),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        var orderTime =
                                                            cartOrderItemsTimeToList();
                                                        Map<int, CartModel>
                                                            moreOrder = {};
                                                        for (var j = 0;
                                                            j <
                                                                getCartHistoryList
                                                                    .length;
                                                            j++) {
                                                          if (getCartHistoryList[
                                                                      j]
                                                                  .time ==
                                                              orderTime[i]) {
                                                            moreOrder
                                                                .putIfAbsent(
                                                              getCartHistoryList[
                                                                      j]
                                                                  .id!,
                                                              () => CartModel
                                                                  .fromJson(
                                                                jsonDecode(
                                                                  jsonEncode(
                                                                    getCartHistoryList[
                                                                        j],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        }
                                                        Get.find<CartProductController>()
                                                                .setCartItems =
                                                            moreOrder;
                                                        Get.find<
                                                                CartProductController>()
                                                            .addToCart();
                                                        Get.toNamed(AppRoutes
                                                            .getCartPage());
                                                      },
                                                      child: Text("one more")),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                          ],
                        ),
                      ),
                    )
                  : NoData(
                      text: "Cart history is empty!",
                      imageData: "assets/images/cart-history.jpg"),
            );
          }),
        ],
      ),
    );
  }
}
