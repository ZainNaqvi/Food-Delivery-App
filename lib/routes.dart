import 'package:flutter/animation.dart';
import 'package:food_delivery_application/screens/food_home_page/food_home_page.dart';
import 'package:food_delivery_application/screens/productDetail/popularProducts.dart';
import 'package:food_delivery_application/screens/recommended_product_page/recommend.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initial = "/";
  static const String popularFoodPage = "/popular-Food-Page";
  static const String recommendFoodPage = "/recommended-Food-Page";

  static String getInitialPage() => "${initial}";
  static String getPopularPage(int pageID) => "$popularFoodPage?pageId=$pageID";
  static String getRecommendedPage(int pageId) =>
      "$recommendFoodPage?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => FoodHomePage(),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: popularFoodPage,
      page: () {
        String? pageId = Get.parameters['pageId'];
        return PopularProductPage(
          itemIndex: int.parse(pageId!),
        );
      },
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
        transition: Transition.leftToRightWithFade,
        curve: Curves.easeInOut,
        name: recommendFoodPage,
        page: () {
          String? pageId = Get.parameters['pageId'];
          return RecommendedProductPage(
                      itemIndex: int.parse(pageId!),
          );
        }),
  ];
}
