import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_header.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/providers/auth/registration_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  header: "Register",
                  tagline: "Create Acount",
                  image: "top.png",
                ),
                Consumer<RegistrationProvider>(
                  builder: (context, value, child) {
                    return Padding(
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
                            CustomTextfeild(controller: value.nameController),
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
                            CustomTextfeild(controller: value.emailController),
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
                            CustomTextfeild(controller: value.phoneController),
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
                                controller: value.passwordController,
                                obscureText: value.isObscure,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.changeObscure();
                                    },
                                    icon: Icon(value.isObscure ? Icons.visibility : Icons.visibility_off),
                                  ),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                                  focusedBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            CustomButton(
                              text: "Register",
                              isLoading: value.isLoading,
                              onTap: () {
                                value.startRegister(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // bool inputValidation() {
  //   var isValid = false;
  //   if (_email.text.isEmpty ||
  //       _name.text.isEmpty ||
  //       _phone.text.isEmpty ||
  //       _password.text.isEmpty) {
  //     isValid = false;
  //   } else if (!EmailValidator.validate(_email.text)) {
  //     isValid = false;
  //   } else {
  //     isValid = true;
  //   }
  //   return isValid;
  // }
}
