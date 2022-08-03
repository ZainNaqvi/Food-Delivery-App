import 'package:get/get.dart';

import '../data/repositories/cart_product_repo.dart';
import '../models/cart_product_model.dart';
import '../models/popular_products_model.dart';

class CartProductController extends GetxController {
  final CartProductRepo cartProductRepo;
  CartProductController({required this.cartProductRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  // for the storage methods only
  List<CartModel> storageItems = [];
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          quantity: value.quantity! + quantity,
          isExists: true,
          time: DateTime.now().toString(),
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            quantity: quantity,
            isExists: true,
            time: DateTime.now().toString(),
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            product: product,
          );
        });
      } else {
        Get.snackbar("Message", "You should add at least an item to the cart");
      }
    }
    // shared preference
    cartProductRepo.addToCartList(getItems);
    // shared preference
    update();
  }

  bool isCartExists(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  var quantity = 0;
  int getQuantity(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalItems = 0;
    _items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalPrice {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setItems = cartProductRepo.getCartList();
    return storageItems;
  }

  set setItems(List<CartModel> items) {
    storageItems = items;
    print("The items in database legth is " + storageItems.length.toString());
    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToCartHistory() {
    cartProductRepo.addToCartHistory();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartProductRepo.getCartHistoryList();
  }

  set setCartItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCart() {
    cartProductRepo.addToCartList(getItems);
    update();
  }
}
