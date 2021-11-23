import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  //firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //show hide password text
  bool _isObscure = true;

  //email controller
  final _email = TextEditingController();

  //password controller
  final _password = TextEditingController();

  //loading state
  bool _isLoading = false;

  //get obscure state
  bool get isObscure => _isObscure;

  //get loading state
  bool get isLoading => _isLoading;

  //get email controller
  TextEditingController get emailController => _email;

  //get password controller
  TextEditingController get passwordController => _password;

  //change obscure state
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  //validate fields
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  //login function
  Future<void> startLogin(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);

        await AuthController().loginUser(
          context,
          _email.text,
          _password.text,
        );

        setLoading();
      } else {
        setLoading();
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
}
