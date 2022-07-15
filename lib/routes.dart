import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/screens/food_home_page/food_home_page.dart';
import 'package:food_delivery_application/screens/productDetail/popularProducts.dart';
import 'package:food_delivery_application/screens/recommended_product_page/recommend.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initial = "/";
  static const String popularFoodPage = "/popularFoodPage";
  static const String recommendFoodPage = "/recommendedFoodPage";
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => FoodHomePage()),
    GetPage(name: recommendFoodPage, page: () => RecommendedProductPage()),
  ];
}
