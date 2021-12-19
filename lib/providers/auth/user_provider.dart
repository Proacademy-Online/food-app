import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/db_controller.dart';
import 'package:food_app/models/objects.dart';
import 'package:food_app/screens/login_screen/login_screen.dart';
import 'package:food_app/screens/main_screens/main_screen.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  //database controller object
  final DatabaseController _databaseController = DatabaseController();

  //usermodel
  late UserModel _userModel;

  //get user data
  UserModel get userModel => _userModel;

  //addressmodel
  final AddressModel _addressModel = AddressModel(addressString: "", latitude: 0, longitude: 0);

  //get address string
  String get address => _addressModel.addressString != "" ? _addressModel.addressString : "select your location";

  //initialize and check whther the user signed in or not
  void initializeUser(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigateTo(context, const LoginPage());
      } else {
        Logger().i('User is signed in!');
        await fetchSingleUser(user.uid);
        UtilFunctions.navigateTo(context, const MainScreen());
      }
    });
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // UtilFunctions.navigateTo(context, const LoginPage());
  }

  Future<void> fetchSingleUser(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;
    notifyListeners();
  }

  //set delivery address
  void setAddress(PickResult result) {
    _addressModel.addressString = result.formattedAddress!;
    _addressModel.latitude = result.geometry!.location.lat;
    _addressModel.longitude = result.geometry!.location.lng;

    notifyListeners();
  }
}
