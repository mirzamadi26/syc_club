import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/login.dart';
import 'package:project/database/authservice.dart';

class SignUpScren extends StatefulWidget {
  SignUpScren({Key? key}) : super(key: key);

  @override
  _SignUpScrenState createState() => _SignUpScrenState();
}

class _SignUpScrenState extends State<SignUpScren> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool passwordVisible = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : Container(
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
                            label: Text("Back",
                                style: GoogleFonts.montserratAlternates(
                                    fontSize: text * 9, color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 7.5,
                  ),
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
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
                          margin:
                              EdgeInsets.only(left: 25, bottom: 22, top: 22),
                          child: Text("Sign Up",
                              style: GoogleFonts.montserratAlternates(
                                  fontSize: text * 15, color: Colors.black)),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        Container(
                          width: width / 1.7,
                          child: Column(
                            children: [
                              Text("Add your details to Sign Up",
                                  style: GoogleFonts.montserratAlternates(
                                      color: Colors.black54)),
                              SizedBox(height: height / 30),
                              TextField(
                                controller: emailController,
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email,
                                      color: Colors.black, size: 26),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Your Email",
                                  hintStyle: GoogleFonts.montserratAlternates(
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(height: height / 35),
                              TextField(
                                controller: passwordController,
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                      size: 26,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Password (Min 6)",
                                  hintStyle: GoogleFonts.montserratAlternates(
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: height / 30,
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
                                        if (emailController.text.isEmpty ||
                                            passwordController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text("Fields are Empty"),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                        if (passwordController
                                                .text.isNotEmpty &&
                                            emailController.text.isNotEmpty &&
                                            passwordController.text.length >
                                                5) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationForm(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text)),
                                          );
                                        }
                                      },
                                      child: Text("Sign Up",
                                          style:
                                              GoogleFonts.montserratAlternates(
                                                  fontSize: text * 15,
                                                  color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          primary: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                                ),
                              )
                            ],
                          ),
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
