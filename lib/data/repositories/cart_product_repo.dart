import 'dart:convert';

import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_product_model.dart';

class CartProductRepo {
  final SharedPreferences sharedPreferences;
  CartProductRepo({required this.sharedPreferences});
  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    // Converting the object to the strings for saving it in the shared preference database in the phone local storage
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    // for saving it in shared preference we have
    sharedPreferences.setStringList(AppConstants.SP_KEY, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.SP_KEY)) {
      carts = sharedPreferences.getStringList(AppConstants.SP_KEY)!;
      // print("Inside of carts" + carts.toString());
    }

    List<CartModel> list = [];
    carts.forEach(
        (element) => list.add(CartModel.fromJson(jsonDecode(element))));
    return list;
  }
}
