import 'package:food_delivery_application/screens/food_home_page/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../models/popular_products_model.dart';
import '../../routes.dart';
import '../../utils/app_constants.dart';
import '../../widgets/circuleIndicator.dart';
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
            GetBuilder<PopularProductController>(
              builder: (value) =>
                  value.isLoading ? header(context) : Container(),
            ),
            // End of the food Home screen header

            // starting of the page view builder
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GetBuilder<PopularProductController>(
                      builder: (value) => value.isLoading
                          ? SizedBox(
                              height: 280.h,
                              width: double.infinity,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: value.PopularProductListData.length,
                                itemBuilder:
                                    (BuildContext context, int itemIndex) {
                                  return _buildStakeContainer(itemIndex,
                                      value.PopularProductListData[itemIndex]);
                                },
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.40),
                              child: Center(
                                child: CircleIndicator(),
                              ),
                            ),
                    ),
                    // dot indicator
                    GetBuilder<PopularProductController>(
                      builder: (value) => value.isLoading
                          ? dotIndicator(
                              currentPageValue: _currentPageValue,
                              dotCount: value.PopularProductListData.length,
                            )
                          : Container(),
                    ),
                    // Popular product text
                    GetBuilder<RecommendedProductController>(
                      builder: (value) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        child: value.isLoading
                            ? Column(
                                children: [
                                  productText(context),
                                  SizedBox(
                                    height: 22.h,
                                  ),
                                  // Popular product list view builder
                                  productList()
                                ],
                              )
                            : Container(),
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
    return GetBuilder<RecommendedProductController>(
      builder: (value) => ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: value.RecommendedProductListData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed(
                      AppRoutes.getRecommendedPage(index, 'recommended-page'));
                },
                child: value.isLoading
                    ? Container(
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
                                  image: NetworkImage(
                                    AppConstants.APP_BASEURL +
                                        "/uploads/" +
                                        value.RecommendedProductListData[index]
                                            .img,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.RecommendedProductListData[index]
                                            .name,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text(
                                        value.RecommendedProductListData[index]
                                            .description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
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
                      )
                    : Container(),
              )),
    );
  }

  Widget _buildStakeContainer(int itemIndex, ProductModel value) {
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
    return GestureDetector(
      onTap: () {
        print("Index is : $itemIndex");
        Get.toNamed(
            AppRoutes.getPopularPage(itemIndex, 'popular-product-page'));
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
                    image: NetworkImage(
                        AppConstants.APP_BASEURL + "/uploads/" + value.img!)),
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
                        value.name!,
                        maxLines: 1,
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
                              value.stars!,
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
                            value.stars!.toString(),
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
