import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Header
        Positioned(
            top: 34.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: AppIcons(
                    context: context,
                    iconData: Icons.arrow_back_ios,
                    backgrounColor: Colors.teal,
                    iconColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 100.w,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.initial),
                  child: AppIcons(
                    context: context,
                    iconData: Icons.home_outlined,
                    backgrounColor: Colors.teal,
                    iconColor: Colors.white,
                  ),
                ),
                AppIcons(
                  context: context,
                  iconData: Icons.shopping_cart,
                  backgrounColor: Colors.teal,
                  iconColor: Colors.white,
                ),
              ],
            )),
        // Lists of the cart items
        Positioned(
            top: 20 * 5.h,
            left: 16.w,
            bottom: 0,
            right: 16.w,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartProductController>(builder: (value) {
                  return ListView.builder(
                    itemCount: value.getItems.length,
                    itemBuilder: (_, index) => Container(
                      height: 100.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(bottom: 10.h),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var productIndex =
                                  Get.find<PopularProductController>()
                                      .PopularProductListData
                                      .indexOf(value.getItems[index].product);
                              if (productIndex >= 0) {
                                Get.toNamed(AppRoutes.getPopularPage(
                                    productIndex, "cart-page"));
                              } else {
                                var productIndex =
                                    Get.find<RecommendedProductController>()
                                        .RecommendedProductListData
                                        .indexOf(value.getItems[index].product);
                                Get.toNamed(AppRoutes.getRecommendedPage(
                                    productIndex, 'cart-page'));
                              }
                            },
                            child: Container(
                              width: 20 * 5.w,
                              height: 20 * 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.APP_BASEURL +
                                      "/uploads/" +
                                      value.getItems[index].img!),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.getItems[index].name!,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                value.getItems[index].time!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ ${value.getItems[index].price!}",
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 0.h),
                                    padding: EdgeInsets.all(8.r),
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            value.addItem(
                                                value.getItems[index].product!,
                                                -1);
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        Text(
                                          value.getItems[index].quantity
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            value.addItem(
                                                value.getItems[index].product!,
                                                1);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ))
      ]),
      bottomNavigationBar: GetBuilder<CartProductController>(
        builder: (value) => Container(
          width: double.maxFinite,
          height: 90.h,
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                padding: EdgeInsets.all(12.r),
                width: 110.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${value.totalPrice}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(18.r),
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  width: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "!Check Out",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
