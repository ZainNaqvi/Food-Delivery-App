import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/screens/cart_items_page/cart_items.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:food_delivery_application/widgets/expandedTextWidget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_product_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes.dart';
import '../../widgets/bottomNavigation.dart';
import '../../widgets/custamBottomBar.dart';
import '../productDetail/components/headerAppIcon.dart';

class RecommendedProductPage extends StatefulWidget {
  int itemIndex;
  String page;
  RecommendedProductPage(
      {Key? key, required this.itemIndex, required this.page})
      : super(key: key);

  @override
  State<RecommendedProductPage> createState() => _RecommendedProductPageState();
}

class _RecommendedProductPageState extends State<RecommendedProductPage> {
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>()
        .RecommendedProductListData[widget.itemIndex];
    Get.find<PopularProductController>()
        .setInitQuantity(product, Get.find<CartProductController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80.h,
            title: SizedBox(
              width: double.maxFinite,
              height: 120.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 4.w,
                    right: 4.w,
                    top: 45.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.page == "cart-page") {
                              Get.toNamed(AppRoutes.getCartPage());
                            } else {
                              Get.toNamed(AppRoutes.getInitialPage());
                            }
                            // Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 8.w),
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<PopularProductController>(builder: (value) {
                          return GestureDetector(
                            onTap: () {
                              if (value.totalItems >= 1)
                                Get.toNamed(AppRoutes.getCartPage());
                            },
                            child: Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (value) => Positioned(
                      top: 38.h,
                      right: -5.w,
                      child: value.totalItems >= 1
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal,
                              ),
                              child: Center(
                                  child: Text(
                                Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.h),
              child: Container(
                padding: EdgeInsets.only(top: 8.h, bottom: 10.h),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Theme.of(context).cursorColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.APP_BASEURL + "/uploads/" + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  top: 16.h, bottom: 10.h, left: 12.w, right: 12.w),
              child: ExpandedTextWidget(
                textLength: 190,
                text: product.description!,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (value) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      value.getIncreament(false);
                    },
                    child: AppIcons(
                      context: context,
                      backgrounColor: Colors.teal,
                      iconData: Icons.remove,
                      iconColor: Colors.white,
                    ),
                  ),
                  Text(
                    "\$12.88 " + "X" + " ${value.cartTotalItems}",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  GestureDetector(
                    onTap: () {
                      value.getIncreament(true);
                    },
                    child: AppIcons(
                      context: context,
                      backgrounColor: Colors.teal,
                      iconData: Icons.add,
                      iconColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            GetBuilder<PopularProductController>(builder: (value) {
              return Container(
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
                      width: 70.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                      padding: EdgeInsets.only(
                          top: 14.h, bottom: 14.h, right: 14.w, left: 14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.teal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          value.addItem(product);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(18.r),
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "\$${product.price!} Add To Cart",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      }),
    );
  }
}
