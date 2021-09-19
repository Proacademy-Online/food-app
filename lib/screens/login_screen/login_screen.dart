// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          color: Color(0xffE5E5E5),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/login_top.png",
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 59,
                        ),
                        Text("Login",
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Text("Access account",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Image.asset("assets/images/google.png")),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Image.asset("assets/images/fb.png")),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text("or Login with Email",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 41),
                        child: Text("Email",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: SizedBox(
                            width: 335,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                            ),
                          )),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 41),
                        child: Text("Password",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: SizedBox(
                            width: 335,
                            child: TextField(
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                            ),
                          )),
                      SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 140, vertical: 20),
                                primary: Color(0xffFFD200),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text("Sign In",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Don’t have an account? ",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xff838383))),
                            TextSpan(
                                text: "  Register",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
