import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/homeController.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/login.dart';
import 'package:project/authentication/signup.dart';
import 'package:project/database/authservice.dart';

class ForgetPassowrd extends StatefulWidget {
  ForgetPassowrd({Key? key}) : super(key: key);

  @override
  _ForgetPassowrdState createState() => _ForgetPassowrdState();
}

class _ForgetPassowrdState extends State<ForgetPassowrd> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            SizedBox(height: height / 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height / 25,
                    width: width / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 14,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Back",
                          style: GoogleFonts.montserratAlternates(
                              color: Colors.black, fontSize: text * 9),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height / 7.5,
            ),
            Expanded(
                child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 25, bottom: 22, top: 22),
                    child: Text("Forget Password",
                        style: GoogleFonts.montserratAlternates(
                            color: Colors.black, fontSize: text * 16)),
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  SingleChildScrollView(
                    child: Container(
                        width: 320,
                        child: Column(children: [
                          Text("Add your details to Reset Password",
                              style: GoogleFonts.montserratAlternates(
                                  color: Colors.black54)),
                          SizedBox(height: height / 35),
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email,
                                  color: Colors.black, size: 26),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Your Email",
                              hintStyle: GoogleFonts.montserratAlternates(
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            height: height / 15,
                          ),
                          SizedBox(
                              width: width / 1.7,
                              height: height / 15,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.black,
                                          Colors.grey,
                                          Colors.black
                                        ])),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await auth.sendPasswordResetEmail(
                                          email: emailController.text);
                                      emailController.clear();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text("Reset Password",
                                        style: GoogleFonts.montserratAlternates(
                                            fontSize: text * 15)),
                                    style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                        primary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                              )),
                          SizedBox(height: height / 20),
                          Text(
                              "You will recieve an email from where you can change password.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserratAlternates(
                                  color: Colors.black54)),
                        ])),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
