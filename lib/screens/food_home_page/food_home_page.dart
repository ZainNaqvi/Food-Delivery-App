import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/screens/food_home_page/components/header.dart';
import 'package:food_delivery_application/screens/productDetail/popularProducts.dart';
import 'package:food_delivery_application/screens/recommended_product_page/recommend.dart';
import '../../widgets/dotindicator.dart';
import 'components/footerCard.dart';
import 'components/productText.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // food Home screen header
            header(context),
            // End of the food Home screen header

            // starting of the page view builder
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 280.h,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return _buildStakeContainer(itemIndex);
                        },
                      ),
                    ),
                    // dot indicator
                    dotIndicator(currentPageValue: _currentPageValue),
                    // Popular product text
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          productText(context),
                          SizedBox(
                            height: 22.h,
                          ),
                          // Popular product list view builder
                          productList()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productList() {
    return SizedBox(
      height: 900.h,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 12,
          // shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RecommendedProductPage()));
                },
                child: Container(
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 16.h,
                      ),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/home_food_2.jpg",
                            )),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nutirtual Free Food Deal with The Good and well taste",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "Nutirtual Free Food Deal with The Good and well taste",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                bottomOfCard(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              )),
    );
  }

  Widget _buildStakeContainer(int itemIndex) {
    Matrix4 matrix4 = Matrix4.identity();
    if (itemIndex == _currentPageValue.floor()) {
      var currentScale =
          1 - (_currentPageValue - itemIndex) * (1 - _scaleFactor);
      var currentTransform = 220.h * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (itemIndex == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - itemIndex + 1) * (1 - _scaleFactor);
      var currentTransform = 220.h * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (itemIndex == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - itemIndex) * (1 - _scaleFactor);
      var currentTransform = 220.h * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, 220.h * (1 - _scaleFactor) / 2, 1);
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PopularProductPage()));
      },
      child: Transform(
        transform: matrix4,
        child: Stack(
          children: [
            Container(
              height: 230.h,
              margin: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                // color: itemIndex.isEven ? Colors.teal : Colors.amber,
                borderRadius: BorderRadius.circular(14.r),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/home_food_1.jpg')),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 95.h,
                margin: EdgeInsets.only(
                  left: 25.w,
                  right: 35.w,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        offset: Offset(5, 0),
                      ),
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 10.h, bottom: 0),
                  width: double.infinity,
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
                      // botton of the custom page view builder card
                      bottomOfCard(context),

                      // dot indicator here
                    ],
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
