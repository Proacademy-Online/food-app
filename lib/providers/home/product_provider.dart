import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/models/objects.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ProductProvider extends ChangeNotifier {
  //restaurent controller instance
  final ProductController _productController = ProductController();

  //image picker instance
  final ImagePicker _picker = ImagePicker();

  //restaurent name
  final _productName = TextEditingController();

  //get email controller
  TextEditingController get nameController => _productName;

  //restaurent id
  final _resId = TextEditingController();

  //get restaurent id controller
  TextEditingController get resIdController => _resId;

  //product price
  final _productPrice = TextEditingController();

  //get product price controller
  TextEditingController get priceController => _productPrice;

  bool _isLoading = false;

  //get loading state
  bool get isLoading => _isLoading;

  //image file
  File _image = File("");

  //get image file
  File get getImg => _image;

  //validation function
  bool inputValidation() {
    var isValid = false;
    if (_productName.text.isEmpty) {
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

  Future<void> startAddProduct(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await _productController.saveProductData(_resId.text, _productName.text, double.parse(_productPrice.text), _image);
        setLoading();

        DialogBox().dialogBox(
          context,
          DialogType.SUCCES,
          'SUCCESS',
          'Product added',
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

  ///////////////////////----------------single restaurent states
  ///
  ///list to store single restaurent products
  List<ProductModel> _products = [];

  ///list to store single restaurent 3 products
  List<ProductModel> _minProductsList = [];

  //getter for single restaurent product list
  List<ProductModel> get products => _products;

  //getter for single restaurent product list
  List<ProductModel> get minPproducts => _minProductsList;

  //fetch products by the resturent id
  Future<void> fetctProductsByResId(String resid) async {
    try {
      _minProductsList.clear();
      _products.clear();

      setLoading(true);
      await _productController.getProducts(resid).then((value) {
        _products = value;

        for (var i = 0; i < value.length; i++) {
          _minProductsList.add(value[i]);
          if (i == 2) break;
        }
        Logger().w(_products.length);
        setLoading();
        notifyListeners();
      });
    } catch (e) {
      Logger().e(e);
      setLoading();
    }
  }
}
