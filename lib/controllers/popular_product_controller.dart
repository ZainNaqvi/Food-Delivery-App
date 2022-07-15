import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/models/popular_products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProduct popularProduct;
  PopularProductController({required this.popularProduct});
  List<dynamic> _list = [];
  List<dynamic> get PopularProductListData => _list;
  Future<void> getPopularProductList() async {
    Response response = await popularProduct.getPopularProductList();
    // ignore: unrelated_type_equality_checks
    if (response.isOk) {
      print("Got Products");
      _list = [];
      _list.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      print("Internal server error");
    }
  }
}
