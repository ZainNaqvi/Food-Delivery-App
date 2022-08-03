import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class PopularProduct extends GetxService {
  final ApiClient apiClient;
  PopularProduct({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return apiClient.getData(uri: AppConstants.POPULAR_PRODUCT_URI);
  }
}
