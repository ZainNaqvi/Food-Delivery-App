import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customBottomNavigation extends StatelessWidget {
  const customBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 90.h,
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
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
                  color: Theme.of(context).accentColor,
                ),
                Text(
                  "0",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
