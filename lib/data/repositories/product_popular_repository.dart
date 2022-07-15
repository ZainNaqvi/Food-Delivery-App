import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProduct extends GetxService {
  final ApiClient apiClient;
  PopularProduct({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return apiClient.getData(uri: AppConstants.POPULAR_PRODUCT_URI);
  }
}
