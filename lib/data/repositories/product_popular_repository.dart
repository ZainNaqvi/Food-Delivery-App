import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProduct extends GetxService {
  final ApiClient apiClient;
  PopularProduct({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return apiClient.getData(uri: "api/v1/products/popular");
  }
}
