import 'package:get/get.dart';

import '../data/repositories/product_popular_repository.dart';
import '../models/cart_product_model.dart';
import '../models/popular_products_model.dart';
import 'cart_product_controller.dart';

class PopularProductController extends GetxController {
  final PopularProduct popularProduct;
  PopularProductController({required this.popularProduct});
  List<dynamic> _list = [];
  // ignore: non_constant_identifier_names
  List<dynamic> get PopularProductListData => _list;
  bool isLoading = false;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get cartTotalItems => _quantity + _inCartItems;

  late CartProductController _cart;
  Future<void> getPopularProductList() async {
    Response response = await popularProduct.getPopularProductList();

    // ignore: unrelated_type_equality_checks
    if (response.isOk) {
      _list = [];
      _list.addAll(Product.fromJson(response.body).products);
      isLoading = true;
      update();
    } else {
      Get.snackbar("Connection Error", "Internal server error");
    }
  }

  getIncreament(bool isIcreament) {
    if (isIcreament) {
      _quantity = chechQuantity(_quantity + 1);
      print("icrement $_quantity");
    } else {
      _quantity = chechQuantity(_quantity - 1);
      print("icrement $_quantity");
    }

    update();
  }

  chechQuantity(int quantity) {
    if ((quantity + _inCartItems) < 0) {
      print("Inconditon $_inCartItems");
      // Get.snackbar("Message", "You cant reduce more.");
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }

      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  setInitQuantity(ProductModel product, CartProductController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exists = false;

    exists = _cart.isCartExists(product);
    if (exists) {
      _inCartItems = _cart.getQuantity(product);
      print("quantity of this id is : " + _inCartItems.toString());
    }
  }

  addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;

    _inCartItems = _cart.getQuantity(product);

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
