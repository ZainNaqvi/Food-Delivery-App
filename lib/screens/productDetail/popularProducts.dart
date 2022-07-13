import 'package:flutter/material.dart';
import 'package:food_delivery_application/screens/productDetail/components/header.dart';
import 'package:food_delivery_application/screens/productDetail/components/headerAppIcon.dart';

import '../../widgets/bottomNavigation.dart';
import 'components/detailProduct.dart';

class PopularProductPage extends StatelessWidget {
  const PopularProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Header for the image
          header(),
          // for the two icons at the top of the image
          headerAppIcon(context),
          // Detail of the popular product
          detailProduct(context),
        ],
      ),
      bottomNavigationBar: customBottomNavigation(),
    );
  }
}
