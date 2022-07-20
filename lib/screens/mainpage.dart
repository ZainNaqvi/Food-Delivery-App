import 'package:flutter/material.dart';
import 'package:food_delivery_application/screens/food_home_page/food_home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodHomePage(),
    );
  }
}
