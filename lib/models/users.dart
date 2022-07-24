import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreaditials {
  final String name;
  final String email;
  final String uid;
  final String password;
  final String phone;

  // creating the constructor here...
  UserCreaditials({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.uid,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      };
  static UserCreaditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreaditials(
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      password: snapshot['password'],
      phone: snapshot['phone'],
    );
  }
}
