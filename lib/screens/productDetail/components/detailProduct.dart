import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/screens/food_home_page/components/footerCard.dart';

import '../../../widgets/expandedTextWidget.dart';

Positioned detailProduct(BuildContext context) {
  return Positioned(
    top: 295.h,
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
            "Chees Side",
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
                  5,
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
          const Expanded(
            child: SingleChildScrollView(
                child: ExpandedTextWidget(
              text:
                  "j jd jfklds jfkldf jdlk fjdsklf jdksljfkldj fkdjsf kdsjfkldf djfkljd sklfj dklfj dskfj kdlsjfklsda jfkldsj fklsdjfklj dsklfjsd klfj sdklfj sdklfj sdklf ksdljf klsdjf klsda jfklsdj fkldsjfklsdj fkljsdklf jsdklfjsdlakfjdlsak  jdsklf jdsklf jdkslf jdkls fjkdls jfkldsfjkdls fjklds fjkdlsfjdk lfj sldkf jdskl fdsj fjds fldks fjd slkf df dskf sd fdsk fldjs klfdjs klfjdsklfjds klfj dsklf jdklsf jdkls fjdl fjd lkfj dslkf dsjflk djskfl djs fdsk fklds fjdskl fjdlskaf ",
            )),
          ),
        ],
      ),
    ),
  );
}
