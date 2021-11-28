import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  //get email controller
  TextEditingController get emailController => _email;

  //get password controller
  TextEditingController get passwordController => _password;

  //get email controller
  TextEditingController get nameController => _name;

  //get password controller
  TextEditingController get phoneController => _phone;

  bool _isLoading = false;

  //get obscure state
  bool get isObscure => _isObscure;

  //get loading state
  bool get isLoading => _isLoading;

  //change obscure state
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  //validation function
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _name.text.isEmpty || _phone.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  Future<void> startRegister(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);

        await AuthController().registerUser(
          context,
          _email.text,
          _password.text,
          _name.text,
          _phone.text,
        );

        setLoading();
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
}
