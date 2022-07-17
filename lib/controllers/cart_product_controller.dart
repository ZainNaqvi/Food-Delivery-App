import 'package:food_delivery_application/data/repositories/cart_product_repo.dart';
import 'package:food_delivery_application/models/cart_product_model.dart';
import 'package:food_delivery_application/models/popular_products_model.dart';
import 'package:get/get.dart';

class CartProductController extends GetxController {
  final CartProductRepo cartProductRepo;
  CartProductController({required this.cartProductRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
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
          );
        });
      } else {
        Get.snackbar("Message", "You should add at least an item to the cart");
      }
    }
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
}
