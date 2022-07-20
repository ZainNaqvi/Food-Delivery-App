import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:food_delivery_application/screens/productDetail/components/header.dart';
import 'package:food_delivery_application/screens/productDetail/components/headerAppIcon.dart';
import 'package:get/get.dart';

import '../../widgets/bottomNavigation.dart';
import 'components/detailProduct.dart';

class PopularProductPage extends StatefulWidget {
  int itemIndex;
  PopularProductPage({Key? key, required this.itemIndex}) : super(key: key);

  @override
  State<PopularProductPage> createState() => _PopularProductPageState();
}

class _PopularProductPageState extends State<PopularProductPage> {
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>()
        .PopularProductListData[widget.itemIndex];
    Get.find<PopularProductController>()
        .setInitQuantity(product, Get.find<CartProductController>());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Header for the image
          header(product.img!),
          // for the two icons at the top of the image
          headerAppIcon(context),
          // Detail of the popular product
          detailProduct(context, product),
          GetBuilder<PopularProductController>(
            builder: (value) => Positioned(
              top: 38.h,
              right: 8.w,
              child: Get.find<PopularProductController>().totalItems >= 1
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
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                    )
                  : Container(),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
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
                    GestureDetector(
                      onTap: () {
                        value.getIncreament(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      value.cartTotalItems.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    GestureDetector(
                      onTap: () {
                        value.getIncreament(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
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
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  width: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "\$${product.price} Add To Cart",
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
        ),
      ),
    );
  }
}
