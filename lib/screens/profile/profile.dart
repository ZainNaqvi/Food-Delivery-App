import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/widgets/appicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        backgroundColor: Theme.of(context).cursorColor,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 34.h),
        child: Column(
          children: [
            AppIcons(
              context: context,
              backgrounColor: Colors.teal,
              iconColor: Colors.white,
              iconData: Icons.person,
              width: 144,
              height: 144,
              size: 74,
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomListTile(
                        context: context,
                        backgrounColor: Colors.teal,
                        iconData: Icons.person,
                        title: 'Zain Haider Naqvi'),
                    CustomListTile(
                        context: context,
                        backgrounColor: Colors.yellow,
                        iconData: Icons.phone,
                        title: '033434323423432423432'),
                    CustomListTile(
                      context: context,
                      backgrounColor: Colors.yellow,
                      iconData: Icons.email,
                      title: 'naqvi3324@gmail.com',
                    ),
                    CustomListTile(
                      context: context,
                      backgrounColor: Colors.yellow,
                      iconData: Icons.location_on,
                      title: 'Fill Your location',
                    ),
                    CustomListTile(
                      context: context,
                      backgrounColor: Colors.red,
                      iconData: Icons.message_outlined,
                      title: 'NONE',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CustomListTile(
      {required BuildContext context,
      required String title,
      required IconData iconData,
      required Color backgrounColor}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
          ]),
          padding:
              EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w, bottom: 8.h),
          child: Row(
            children: [
              AppIcons(
                context: context,
                backgrounColor: backgrounColor,
                iconData: iconData,
                iconColor: Colors.white,
                width: 54,
                height: 54,
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        SizedBox(height: 22.w),
      ],
    );
  }
}
