import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/expandedTextWidget.dart';
import '../../food_home_page/components/footerCard.dart';

Positioned detailProduct(BuildContext context, final product) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.4,
    left: 0,
    right: 0,
    child: Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name!,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                  product.stars!,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.teal,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "4.5",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "1232",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "Comments",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          bottomOfCard(context),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "Introduce",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: ExpandedTextWidget(
              textLength: 70,
              text: product.description!,
            )),
          ),
        ],
      ),
    ),
  );
}
