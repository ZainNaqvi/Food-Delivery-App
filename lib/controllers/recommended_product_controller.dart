import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProduct recommendedProduct;
  RecommendedProductController({required this.recommendedProduct});
  List<dynamic> _list = [];
  List<dynamic> get RecommendedProductListData => _list;
  bool isLoading = false;
  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProduct.getRecommendedProductList();
    // ignore: unrelated_type_equality_checks
    if (response.isOk) {
      print("Got Products");
      _list = [];
      _list.addAll(Product.fromJson(response.body).products);
      isLoading = true;
      update();
    } else {
      print("Internal server error");
    }
  }
}
