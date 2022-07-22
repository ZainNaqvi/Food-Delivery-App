import 'dart:convert';

import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_product_model.dart';

class CartProductRepo {
  final SharedPreferences sharedPreferences;
  CartProductRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.remove(AppConstants.SP_KEY);
    sharedPreferences.remove(AppConstants.CART_HISTORY);
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

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY)) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(
        AppConstants.CART_HISTORY,
      )!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) =>
        cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));
    return cartHistoryList;
  }

  void addToCartHistory() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY)) {
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY)!;
    }
    for (var i = 0; i < cart.length; i++) {
      print("cart history" + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY, cartHistory);
    print("total history items" + getCartHistoryList().length.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.SP_KEY);
  }
}
