import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../food_home_page/components/footerCard.dart';

class PopularProductPage extends StatelessWidget {
  const PopularProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header for the image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 310.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/home_food_1.jpg'),
                ),
              ),
            ),
          ),
          // for the two icons at the top of the image
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 45.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                Container(
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
              ],
            ),
          ),
          // Detail of the popular product
          Positioned(
            top: 295.h,
            left: 0,
            right: 0,
            child: Container(
              height: 300.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
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
                    height: 8.h,
                  ),
                  Text(
                    "Introduce",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        "Jfdklsdjfkldjaflkdskfjdslafkldsjfkdslfdsklfjdsklfjdskljfklsdjfklsdjfkldsjfkljdsklfjdsklfjdskljfkldsjfkdsjfkljdsklfjdsklfjdslkjfkdlsjfkdlsjfklsdjfkldsjfkldsjfkljdsklfjdskljfkldsjfkdsjfkljdsklfjdsklfjklsdjfkldsjfklsdajfkldsjfkldsjfkldsjfkldsjfklasdjfkldjskfjdskljfklsdjfkjsdklfjkladsjfkldsfdkslf jdsklf jdsklf jdkslf jdkls fjkdls jfkldsfjkdls fjklds fjkdlsfjdk lfj sldkf jdskl fdsj fjds fldks fjd slkf df dskf sd fdsk fldjs klfdjs klfjdsklfjds klfj dsklf jdklsf jdkls fjdl fjd lkfj dslkf dsjflk djskfl djs fdsk fklds fjdskl fjdlskaf ",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
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
                  Icon(
                    Icons.remove,
                  ),
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Icon(
                    Icons.add,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18.r),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              width: 180.w,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "\$6786 Add To Cart",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
