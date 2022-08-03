import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllAddress extends GetxController implements GetxService{
  DocumentSnapshot? snapshot;
  bool isLoading = false;
  allAddressList() async {
    if (FirebaseAuth.instance.currentUser != null) {
      isLoading = true;

      final data = await FirebaseFirestore.instance
          .collection("users_address")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      isLoading = false;
      snapshot = data;
    
    }
    update();
  }
}
