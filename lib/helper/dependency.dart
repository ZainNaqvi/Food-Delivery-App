import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() =>
      ApiClient(appbaseurl: "http://mvs.bslmeiyu.com/api/v1/products/popular"));
  Get.lazyPut(() => PopularProduct(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProduct: Get.find()));
}
