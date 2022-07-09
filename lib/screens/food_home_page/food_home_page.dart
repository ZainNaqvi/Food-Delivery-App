import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/constants.dart';
import 'package:food_delivery_application/screens/food_home_page/components/header.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  PageController _controller = PageController(viewportFraction: 0.85);
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
                  controller: _controller,
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
    return Stack(
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
            height: 80.h,
            margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 8.h),
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
                  Row(
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Normal",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
