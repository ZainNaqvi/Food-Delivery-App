import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_application/models/address_model.dart';
import 'package:get/get.dart';

class Firestore {
  final firestore = FirebaseFirestore.instance;
  Future<String> createUser({
    required String name,
    required String addressType,
    required String phone,
    required String address,
    required String latitude,
    required String longitude,
    required String id,
  }) async {
    String res = 'Some Error occured';
    try {
      AddressModel addressModel = AddressModel(
        addressType: addressType,
        address: address,
        contactPersonName: name,
        contactPersonNumber: phone,
        id: id,
        latitude: latitude,
        longitude: longitude,
      );
      // add user to the database
      await firestore
          .collection("users_address")
          .doc(id)
          .set(addressModel.toJson());
      res = "success";
      Get.snackbar("Message", "The data is successfully submited.");
    } catch (err) {
      res = err.toString();
      Get.snackbar("Message", res);
    }
    return res;
  }
}
