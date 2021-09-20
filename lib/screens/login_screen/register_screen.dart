import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
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
                Stack(
                  children: [
                    Image.asset(
                      Constants.imageAsset('top.png'),
                      width: size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Text(
                            "Register",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Create Acount",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        CustomTextfeild(controller: _name),
                        const SizedBox(height: 14),
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
                          'Phone Number',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        CustomTextfeild(controller: _phone),
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
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (inputValidation()) {
                                print('success');
                              } else {
                                print('errrorrrrrr');
                              }
                            },
                            child: Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                minimumSize: const Size(double.infinity, 15),
                                primary: const Color(0xffFFD200),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _phone.text.isEmpty ||
        _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_phone.text.length != 10) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
