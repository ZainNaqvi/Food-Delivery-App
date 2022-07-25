import 'package:flutter/material.dart';
import 'package:food_delivery_application/Auth/sign_in_page.dart';
import 'package:food_delivery_application/screens/cart_history_page/cart_history.dart';
import 'package:food_delivery_application/screens/food_home_page/food_home_page.dart';
import 'package:food_delivery_application/screens/profile/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage = 0;
  final List _pages = [
    FoodHomePage(),
    Signin(),
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
      body: _pages[selectedPage],
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
