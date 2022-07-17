import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/screens/productDetail/components/header.dart';
import 'package:food_delivery_application/screens/productDetail/components/headerAppIcon.dart';
import 'package:get/get.dart';

import '../../widgets/bottomNavigation.dart';
import 'components/detailProduct.dart';

class PopularProductPage extends StatelessWidget {
  int itemIndex;
  PopularProductPage({Key? key, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().PopularProductListData[itemIndex];
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
              right: 18.w,
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
      bottomNavigationBar: customBottomNavigation(pageId: itemIndex),
    );
  }
}
