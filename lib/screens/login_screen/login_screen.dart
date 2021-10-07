import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_loader.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/screens/login_screen/forgot_password_screen.dart';
import 'package:food_app/screens/login_screen/register_screen.dart';
import 'package:food_app/screens/splash_screen/getting_started.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: size.height,
          color: const Color(0xffE5E5E5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomHeader(
                  size: size,
                  header: "Login",
                  tagline: "Access Acount",
                  image: "top.png",
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: Colors.white,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              Constants.imageAsset('google.png'),
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: Colors.white,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              Constants.imageAsset('facebook.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'or Login with Email',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            CustomTextfeild(controller: _email),
                            const SizedBox(height: 14),
                            Text(
                              'Password',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: double.infinity,
                              child: TextField(
                                controller: _password,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            isLoading
                                ? const CustomLoader()
                                : CustomButton(
                                    text: "Sign In",
                                    onTap: () async {
                                      if (inputValidation()) {
                                        setState(() {
                                          isLoading = true;
                                        });

                                        AuthController().loginUser(
                                          context,
                                          _email.text,
                                          _password.text,
                                        );

                                        setState(() {
                                          isLoading = false;
                                        });
                                      } else {
                                        DialogBox().dialogBox(
                                          context,
                                          DialogType.ERROR,
                                          'Incorrect information.',
                                          'Please enter correct information',
                                        );
                                      }
                                    },
                                  ),
                            const SizedBox(height: 20),
                            Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Register",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        UtilFunctions.navigateTo(
                                            context, const RegisterPage());
                                      },
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              child: const Center(
                                  child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 16),
                              )),
                              onTap: () {
                                UtilFunctions.navigateTo(
                                    context, const ForgotPasswordPage());
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
