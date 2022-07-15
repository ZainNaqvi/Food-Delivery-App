import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProduct popularProduct;
  PopularProductController({required this.popularProduct});
  List<dynamic> _list = [];
  List<dynamic> get PopularProductListData => _list;
  Future<void> getPopularProductList() async {
    Response response = await popularProduct.getPopularProductList();
    if (response.status == 200) {
      _list = [];
      // _list.addAll();
      update();
    }
  }
}
