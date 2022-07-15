import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProduct extends GetxService {
  final ApiClient apiClient;
  RecommendedProduct({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return apiClient.getData(uri: AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
