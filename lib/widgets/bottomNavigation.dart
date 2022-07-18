import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

class customBottomNavigation extends StatelessWidget {
  final pageId;
  const customBottomNavigation({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().PopularProductListData[pageId];
    return GetBuilder<PopularProductController>(
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
                    value.cartItems.toString(),
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
               
                value.addItem(product);
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
    );
  }
}
