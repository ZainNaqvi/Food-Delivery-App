import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/data/repositories/cart_product_repo.dart';
import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/data/repositories/recommended_product_repo.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // Start of the shared preference
  final sharePreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharePreference);
  // End of the shared preference
  Get.lazyPut(() => ApiClient(appbaseurl: AppConstants.APP_BASEURL));
  Get.lazyPut(() => PopularProduct(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProduct(apiClient: Get.find()));
  Get.lazyPut(() => CartProductRepo());
  Get.lazyPut(() => PopularProductController(popularProduct: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProduct: Get.find()));
  Get.lazyPut(() => CartProductController(cartProductRepo: Get.find()));
}
