import 'package:food_delivery_application/screens/add_address_page/add_address_page.dart';
import 'package:food_delivery_application/screens/cart_items_page/cart_items.dart';
import 'package:food_delivery_application/screens/mainpage.dart';
import 'package:food_delivery_application/screens/pick_address_page/pick_address_page.dart';
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
  static const String addressPage = "/add-address-page";
  static const String pickAddressPage = "/pick-address-page";

  static String getSplash() => "${splash}";
  static String getInitialPage() => "${initial}";
  static String getPopularPage(int pageID, String page) =>
      "$popularFoodPage?pageId=$pageID&page=$page";
  static String getRecommendedPage(int pageId, String page) =>
      "$recommendFoodPage?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";
  static String getAddressPage() => "$addressPage";
  static String getPickAddress() => "$pickAddressPage";

  static List<GetPage> routes = [
    GetPage(
      name: pickAddressPage,
      page: () {
        PickAddressPage _pick_address_page = Get.arguments;

        return _pick_address_page;
      },
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: "/",
      page: () => const MainPage(),
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
      },
    ),
    GetPage(
      transition: Transition.leftToRightWithFade,
      name: addressPage,
      page: () {
        return const AddAddressPage();
      },
    ),
  ];
}
