import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/popular_product_controller.dart';
import '../../../routes.dart';

Positioned headerAppIcon(BuildContext context, String page) {
  return Positioned(
    left: 18.w,
    right: 18.w,
    top: 45.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (page == "cart-page") {
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
              if (value.totalItems >= 1) Get.toNamed(AppRoutes.getCartPage());
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
        }
        ),
      ],
    ),
  );
}
