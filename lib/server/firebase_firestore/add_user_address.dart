import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_application/data/repositories/location_repo.dart';
import 'package:food_delivery_application/models/address_model.dart';
import 'package:get/get.dart';

import '../../controllers/add_address_user.dart';
import '../../controllers/location_controller.dart';

class AddAddress extends GetxController {
  bool isSaving = false;
  final firestore = FirebaseFirestore.instance;
  Future<String> addAddress({
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
      // LocationController(locationRepo: Get.find()).getAddressList();

      Future.delayed(Duration(seconds: 1));
      res = "success";
      Get.snackbar("Message", "The Address is saved Successfully.");
    } catch (err) {
      res = err.toString();
      // Get.snackbar("Message", res);
    }
    update();
    return res;
  }
}
