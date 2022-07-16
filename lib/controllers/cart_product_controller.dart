import 'package:food_delivery_application/data/repositories/cart_product_repo.dart';
import 'package:food_delivery_application/models/cart_product_model.dart';
import 'package:food_delivery_application/models/popular_products_model.dart';
import 'package:get/get.dart';

class CartProductController extends GetxController {
  final CartProductRepo cartProductRepo;
  CartProductController({required this.cartProductRepo});
  Map<int, CartModel> _items = {};
  void addItem(ProductModel product, int quantity) {
    print("Totla items in list are : ${_items.length.toString()}");
    _items.putIfAbsent(product.id!, () {
      print("Product id is : ${product.id} and quantity is :$quantity");
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
  }
}
