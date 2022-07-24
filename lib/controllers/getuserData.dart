import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetUserData extends GetxController {
  DocumentSnapshot? snapshot;
  bool isLoading = false;
  getUserData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      isLoading = true;

      final data = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      isLoading = false;
      snapshot = data;
    }
    update();
  }
}
