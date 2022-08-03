import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/add_address_user.dart';
import '../controllers/cart_product_controller.dart';
import '../controllers/getuserData.dart';
import '../controllers/location_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repositories/cart_product_repo.dart';
import '../data/repositories/location_repo.dart';
import '../data/repositories/product_popular_repository.dart';
import '../data/repositories/recommended_product_repo.dart';
import '../server/firebase_firestore/add_user_address.dart';
import '../utils/app_constants.dart';

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
