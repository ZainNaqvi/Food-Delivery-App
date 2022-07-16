import 'package:flutter/material.dart';
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
        .setInitQuantity(Get.find<CartProductController>());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Header for the image
          header(product.img!),
          // for the two icons at the top of the image
          headerAppIcon(context),
          // Detail of the popular product
          detailProduct(context, product),
        ],
      ),
      bottomNavigationBar: customBottomNavigation(pageId: itemIndex),
    );
  }
}
