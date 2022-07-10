import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/screens/food_home_page/components/header.dart';
import 'components/footerCard.dart';

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
        child: Container(
          child: Column(
            children: [
              // food Home screen header
              header(context),
              // End of the food Home screen header

              // starting of the page view builder
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
            ],
          ),
        ),
      ),
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
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: 220.h,
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: itemIndex.isEven ? Colors.teal : Colors.amber,
              borderRadius: BorderRadius.circular(14.r),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/home_food_1.jpg')),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.h,
              margin: EdgeInsets.only(
                left: 30.w,
                right: 30.w,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 8.h, bottom: 8.h),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chees Side",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
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
                      height: 12.h,
                    ),
                    // botton of the custom page view builder card
                    bottomOfCard(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
