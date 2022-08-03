import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class RecommendedProduct extends GetxService {
  final ApiClient apiClient;
  RecommendedProduct({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return apiClient.getData(uri: AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
