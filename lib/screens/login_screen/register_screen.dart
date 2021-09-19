// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                      Text("Register",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text("Creating account",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Image.asset("assets/images/fb.png")),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("or Login with Email",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 9,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 41),
                            child: Text("User name",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 8,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              )),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 41),
                            child: Text("Email",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 8,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              )),
                          SizedBox(
                            height: 9,
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
                            height: 8,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              )),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 41),
                            child: Text("Phone number",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 8,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 135, vertical: 17),
                                    primary: Color(0xffFFD200),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text("Register",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
