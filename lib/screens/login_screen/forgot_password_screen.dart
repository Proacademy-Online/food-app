import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_loader.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _email = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: const Color(0xffE5E5E5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(
                size: size,
                header: "Forgot Password",
                tagline: "Reset your password",
                image: "top.png",
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    const SizedBox(height: 35),
                    isLoading
                        ? const CustomLoader()
                        : CustomButton(
                            text: "Send password reset email",
                            onTap: () async {
                              if (inputValidation()) {
                                setState(() {
                                  isLoading = true;
                                });

                                await AuthController().sendPasswordResetEmail(
                                    context, _email.text);

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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
