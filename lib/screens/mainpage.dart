import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_application/Auth/sign_in_page.dart';
import 'package:food_delivery_application/screens/cart_history_page/cart_history.dart';
import 'package:food_delivery_application/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';
import 'package:get/get.dart';

import '../widgets/customSnakeBar.dart';
import 'food_home_page/food_home_page.dart';
import 'order_page/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage = 0;
  final List _pages = [
    FoodHomePage(),
    OrderPage(),
    CartHistoryPage(),
    ProfileScreen(),
  ];
  onTap(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (context, snapshot) {
          // if user start the app
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return _pages[selectedPage];
            } else if (snapshot.hasError) {
              return showSnakeBar(snapshot.error.toString(), context);
            }
          }
//if the state is waiting so we have to show the circular progressive indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircleIndicator());
          }
          return Signin();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Color(0xff5B73D0)),
          unselectedIconTheme: IconThemeData(color: Color(0xffD0D1D7)),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTap,
          currentIndex: selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "",
            ),
          ]),
    );
  }
}
