import 'package:food_delivery_application/controllers/add_address_user.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/getuserData.dart';
import 'package:food_delivery_application/controllers/location_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/data/repositories/cart_product_repo.dart';
import 'package:food_delivery_application/data/repositories/location_repo.dart';
import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/data/repositories/recommended_product_repo.dart';
import 'package:food_delivery_application/server/firebase_firestore/add_user_address.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // SharedPreferences.setMockInitialValues({});
  // Start of the shared preference
  final sharePreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharePreference);
  // End of the shared preference


  Get.lazyPut(() => ApiClient(appbaseurl: AppConstants.APP_BASEURL));
  Get.lazyPut(() => PopularProduct(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProduct(apiClient: Get.find()));
  Get.lazyPut(() => CartProductRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));




  Get.lazyPut(() => PopularProductController(popularProduct: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProduct: Get.find()));
  Get.lazyPut(() => CartProductController(cartProductRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  
  Get.lazyPut(() => GetUserData());
  Get.lazyPut(() => AddAddress());
  Get.lazyPut(() => AllAddress());
}
