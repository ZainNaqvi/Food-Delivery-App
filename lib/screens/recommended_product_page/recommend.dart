import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:food_delivery_application/widgets/expandedTextWidget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_product_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../widgets/bottomNavigation.dart';
import '../../widgets/custamBottomBar.dart';
import '../productDetail/components/headerAppIcon.dart';

class RecommendedProductPage extends StatelessWidget {
  int itemIndex;
  RecommendedProductPage({Key? key, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().PopularProductListData[itemIndex];
    Get.find<PopularProductController>()
        .setInitQuantity(product, Get.find<CartProductController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80.h,
            title: headerAppIcon(context),
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
               AppConstants.APP_BASEURL+"/uploads/"+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  top: 16.h, bottom: 10.h, left: 12.w, right: 12.w),
              child:  ExpandedTextWidget(
                textLength: 190,
                text:product.description!,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                  context: context,
                  backgrounColor: Colors.teal,
                  iconData: Icons.remove,
                  iconColor: Colors.white,
                ),
                Text(
                  "\$12.88 " + "X" + "0",
                  style: Theme.of(context).textTheme.headline2,
                ),
                AppIcons(
                  context: context,
                  backgrounColor: Colors.teal,
                  iconData: Icons.add,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          BottomBar(context,product),
        ],
      ),
    );
  }
}
