import 'package:flutter/cupertino.dart';
import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/data/repositories/product_popular_repository.dart';
import 'package:food_delivery_application/models/popular_products_model.dart';
import 'package:get/get.dart';

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
  int get cartItems => _inCartItems + _quantity;
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
    } else {
      _quantity = chechQuantity(_quantity - 1);
    }
    update();
  }

  chechQuantity(int quantity) {
    if (quantity <= 0) {
      return 0;
    } else if (quantity >= 20) {
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
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;

      Get.snackbar("Message", "The items are added to the list.");
    } else {
      Get.snackbar("Message", "You should add at least an item to the cart");
    }
  }
}
