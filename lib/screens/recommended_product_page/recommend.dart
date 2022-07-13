import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:food_delivery_application/widgets/expandedTextWidget.dart';

import '../../widgets/bottomNavigation.dart';
import '../../widgets/custamBottomBar.dart';
import '../productDetail/components/headerAppIcon.dart';

class RecommendedProductPage extends StatelessWidget {
  const RecommendedProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                    "Chinees Food Shop ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Theme.of(context).cursorColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/home_food_1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  top: 16.h, bottom: 10.h, left: 12.w, right: 12.w),
              child: const ExpandedTextWidget(
                textLength: 190,
                text:
                    "dsfasdf dsfdsaf dsf dsf sd fds f sd fds f dsf ds f dsf dsf ds f dsf dsf ad f dsf dasf ds f dsf sdf d f dsf dsf ds f dsf ds fd sf ewr er d f fd sf df ewr ew  f dsf df ds fds f sdf sdf sd f dsf f dsf ds fs df dsf dsf dsf asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew re asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew r asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew r asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew r asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew r asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew r asd fds f asdf ds f dsf ds fds f df ds fds f dsf dsf sd fds f dsf dsf ds f adsf dsf sda fd sf sdf af ds fad sfa dsf dsf asd fsd fds fsd fd sfasd fds fd sf dsf dsf dsf sda fds f dsf dsf ds fds fd sf dsf  r ewr er ew rw r ew rew  d ds f cc  vc v df ds fd sf ds fd sf dsf ds fds f dsf ds fd f dsf ds f dsf ds fds f sd fds fd sf dsf ds f dsf dsf ds fd sf d fds f dsf ds fsd fd sfd f ds fds f df dsf ds fds f",
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
          BottomBar(context),
        ],
      ),
    );
  }
}
