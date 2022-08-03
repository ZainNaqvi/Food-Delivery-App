
import 'package:food_delivery_application/models/popular_products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExists;
  String? time;
  ProductModel? product;
  CartModel({
    this.quantity,
    this.isExists,
    this.time,
    this.id,
    this.name,
    this.price,
    this.img,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExists = json['isExists'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExists": this.isExists,
      "time": this.time,
      "product": this.product!.toJson(),
    };
  }
}
