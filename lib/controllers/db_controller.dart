import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  // Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a collection refferance
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Save user information
  Future<void> saveUserData(
    String name,
    String phone,
    String email,
    String uid,
  ) {
    return users
        .doc(uid)
        .set({
          'name': name,
          'email': email,
          'phone': phone,
          'uid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
