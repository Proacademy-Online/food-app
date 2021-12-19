import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/objects.dart';
import 'package:logger/logger.dart';

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
          'address': null,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //update user selected address
  Future<void> updateAddress(UserModel user) async {
    return users
        .doc(user.uid)
        .set({
          'name': user.name,
          'email': user.email,
          'phone': user.phoneNo,
          'uid': user.uid,
          'address': user.address!.toJson(),
        })
        .then((value) => Logger().i("User updated"))
        .catchError((error) => Logger().e("Failed to update user: $error"));
  }

  //get user data
  Future<UserModel?> getUserData(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());
      UserModel userModel = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      Logger().d(userModel.name);

      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
