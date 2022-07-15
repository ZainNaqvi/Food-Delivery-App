import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/data/repositories/recommended_product_repo.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appbaseurl: AppConstants.APP_BASEURL));
  Get.lazyPut(() => PopularProduct(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProduct(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProduct: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProduct: Get.find()));
}
