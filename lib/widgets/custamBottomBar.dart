import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/popular_product_controller.dart';

BottomBar(BuildContext context, final product) =>
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
              margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
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
    });
