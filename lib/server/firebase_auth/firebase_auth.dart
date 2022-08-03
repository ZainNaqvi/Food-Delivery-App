
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../models/users.dart';
// import 'package:flutter/material.dart';

class AuthUser {
  // creating the instances of the firebase authentification
  final FirebaseAuth _auth = FirebaseAuth.instance;
// creating the instances of the firebase firestore cloud database
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// for the provider
  Future<UserCreaditials> getUserDetails() async {
    // getting the current user by firebase auth
    User currentUser = _auth.currentUser!;

    //getting the data

    DocumentSnapshot snapshot = await _firebaseFirestore
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .catchError(
      (onError) {
        print(onError);
      },
    );

    return UserCreaditials.fromSnap(snapshot);
  }
  // Creating the function which is responsible for the auth related work

  Future<String> createUser({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    String res = 'Some Error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          phone.isNotEmpty) {
        // validation for authentication firebase authentification tab

        UserCredential creaditials = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // printing the user uid as we know the user id could'nt null
        print(creaditials.user!.uid);

        UserCreaditials userCreaditials = UserCreaditials(
          name: name,
          uid: creaditials.user!.uid,
          phone: phone,
          email: email,
          password: password,
        );
        // add user to the database
        await _firebaseFirestore
            .collection("users")
            .doc(creaditials.user!.uid)
            .set(userCreaditials.toJson());
        res = "success";
        Get.snackbar("Message", "The data is successfully submited.");
      } else {
        res = "All Fields are Required";
        Get.snackbar("Message", res);
      }
    } catch (err) {
      res = err.toString();
      Get.snackbar("Message", res);
    }
    return res;
  }

  // creating the logging fucntion whom user login
  Future<String> userLogin(
      {required String email, required String password}) async {
    String res = "Some error occured.";
    // checking the values are empty or not
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // now checking and login the user
        UserCredential credential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);
        // if all set than responce will be success
        res = "success";

      } else {
        res = "All the Fields are required";
        Get.snackbar("Message", res);
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        res = "Invalid Creaditials";
        Get.snackbar("Message", res);
      }
    } catch (err) {
      res = err.toString();
      Get.snackbar("Message", res);
    }
    return res;
  }

  // signout
  Future<String> signOut() async {
    String res = "Some error Occured";
    try {
      await _auth.signOut();
      res = "Logout Done.";
      Get.snackbar("Message", res);
    } catch (e) {
      res = e.toString();
      Get.snackbar("Message", res);
    }
    return res;
  }
}
