import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/add_address_user.dart';
import 'package:food_delivery_application/controllers/getuserData.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:food_delivery_application/screens/no_data/no_cart_page.dart';
import 'package:food_delivery_application/server/firebase_auth/firebase_auth.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';
import 'package:get/get.dart';

import '../../controllers/location_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      body: GetBuilder<GetUserData>(builder: (value) {
        return FirebaseAuth.instance.currentUser == null
            ? NoData(
                text:
                    "Complete the registration form by entering all the required fields. Required fields are indicated with an asterisk (*).",
                yes: true,
                imageData: 'assets/images/unauth.jpg',
              )
            : value.isLoading
                ? Center(child: CircleIndicator())
                : Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 8.h),
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
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: 18.h),
                                CustomListTile(
                                    context: context,
                                    backgrounColor: Colors.teal,
                                    iconData: Icons.person,
                                    title: value.snapshot!['name']),
                                CustomListTile(
                                    context: context,
                                    backgrounColor: Colors.yellow,
                                    iconData: Icons.phone,
                                    title: value.snapshot!['phone']),
                                CustomListTile(
                                  context: context,
                                  backgrounColor: Colors.yellow,
                                  iconData: Icons.email,
                                  title: value.snapshot!['email'],
                                ),
                                Get.find<LocationController>()
                                        .addressList
                                        .isEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              AppRoutes.getAddressPage());
                                        },
                                        child: CustomListTile(
                                          context: context,
                                          backgrounColor: Colors.yellow,
                                          iconData: Icons.location_on,
                                          title: 'Fill Your location',
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              AppRoutes.getAddressPage());
                                        },
                                        child: CustomListTile(
                                          context: context,
                                          backgrounColor: Colors.yellow,
                                          iconData: Icons.location_on,
                                          title: 'Your address',
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: () async {
                                    await AuthUser().signOut();
                                    Get.toNamed(AppRoutes.getInitialPage());
                                  },
                                  child: CustomListTile(
                                    context: context,
                                    backgrounColor: Colors.red,
                                    iconData: Icons.message_outlined,
                                    title: 'Logout',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
      }),
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
