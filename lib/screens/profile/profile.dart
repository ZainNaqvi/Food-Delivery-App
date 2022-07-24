import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/models/users.dart';
import 'package:food_delivery_application/screens/no_data/no_cart_page.dart';
import 'package:food_delivery_application/widgets/appicons.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DocumentSnapshot? snapshot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  bool isLoading = false;
  getUserData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoading = true;
      });
      final data = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setState(() {
        isLoading = false;
        snapshot = data;
      });
    }
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
      body: FirebaseAuth.instance.currentUser == null
          ? NoData(text: "No")
          : isLoading
              ? Center(child: CircleIndicator())
              : Container(
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
                                  title: snapshot!['name']),
                              CustomListTile(
                                  context: context,
                                  backgrounColor: Colors.yellow,
                                  iconData: Icons.phone,
                                  title: snapshot!['phone']),
                              CustomListTile(
                                context: context,
                                backgrounColor: Colors.yellow,
                                iconData: Icons.email,
                                title: snapshot!['email'],
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
