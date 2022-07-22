import 'package:flutter/animation.dart';
import 'package:food_delivery_application/screens/cart_items_page/cart_items.dart';
import 'package:food_delivery_application/screens/food_home_page/food_home_page.dart';
import 'package:food_delivery_application/screens/mainpage.dart';
import 'package:food_delivery_application/screens/productDetail/popularProducts.dart';
import 'package:food_delivery_application/screens/recommended_product_page/recommend.dart';
import 'package:food_delivery_application/screens/splash_page/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splash = "/splash";
  static String initial = "/";
  static const String popularFoodPage = "/popular-Food-Page";
  static const String recommendFoodPage = "/recommended-Food-Page";
  static const String cartPage = "/cart-page";

  static String getSplash() => "${splash}";
  static String getInitialPage() => "${initial}";
  static String getPopularPage(int pageID, String page) =>
      "$popularFoodPage?pageId=$pageID&page=$page";
  static String getRecommendedPage(int pageId, String page) =>
      "$recommendFoodPage?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: "/",
      page: () => MainPage(),
      transition: Transition.leftToRightWithFade,

    ),
    GetPage(
      name: popularFoodPage,
      page: () {
        String? pageId = Get.parameters['pageId'];
        String? page = Get.parameters['page'];
        return PopularProductPage(
          itemIndex: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.leftToRightWithFade,

    ),
    GetPage(
        transition: Transition.leftToRightWithFade,

        name: recommendFoodPage,
        page: () {
          String? pageId = Get.parameters['pageId'];
          String? page = Get.parameters['page'];
          return RecommendedProductPage(
                      itemIndex: int.parse(pageId!),
            page: page!,
          );
        }),
    GetPage(
        transition: Transition.leftToRightWithFade,
        name: cartPage,
        page: () {
          return CartPage();
        }),
  ];
}
