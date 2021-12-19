import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/res_controller.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class RestaurentProvider extends ChangeNotifier {
  //restaurent controller instance
  final ResController _resController = ResController();

  //image picker instance
  final ImagePicker _picker = ImagePicker();

  //restaurent name
  final _name = TextEditingController();

  //get email controller
  TextEditingController get nameController => _name;

  bool _isLoading = false;

  //get loading state
  bool get isLoading => _isLoading;

  //res latitude
  double lat = 0.0;

  //res longtitude
  double lng = 0.0;

  //res address string
  String addressString = '';

  //get address string
  String get address => addressString;

  //image file
  File _image = File("");

  //get image file
  File get getImg => _image;

//set selected restaurent coordinates
  void setCoordinates(PickResult result) {
    addressString = result.formattedAddress!;
    lat = result.geometry!.location.lat;
    lng = result.geometry!.location.lng;
    notifyListeners();
  }

  //validation function
  bool inputValidation() {
    var isValid = false;
    if (_name.text.isEmpty) {
      isValid = false;
    }
    // else if (!EmailValidator.validate(_email.text)) {
    //   isValid = false;
    // }
    else {
      isValid = true;
    }
    return isValid;
  }

  Future<void> startAddRestaurent(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await _resController.saveResData(_name.text, lat, lng, _image);
        setLoading();

        DialogBox().dialogBox(
          context,
          DialogType.SUCCES,
          'SUCCESS',
          'restaurent added',
        );
      } else {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Incorrect information.',
          'Please enter correct information',
        );
      }
    } catch (e) {
      setLoading();
      Logger().e(e);
    }
  }

  //change loading state
  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }

//function to pick image from gallery
  Future<void> selectImage() async {
    try {
      // Pick an image
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      //check if the image file is null
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Logger().w(_image.path);
        notifyListeners();
      } else {
        Logger().e("No image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
