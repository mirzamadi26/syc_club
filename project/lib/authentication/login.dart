import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/homeController.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/forgetpassword.dart';
import 'package:project/authentication/signup.dart';
import 'package:project/database/authservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthHome()));
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 14,
                              color: Colors.black,
                            ),
                            label: Text("Back",
                                style: GoogleFonts.montserratAlternates(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90,
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
                          child: Text("Login",
                              style: GoogleFonts.montserratAlternates(
                                  fontSize: 20, color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: 320,
                            child: Column(
                              children: [
                                Text("Add your details to login",
                                    style: GoogleFonts.montserratAlternates(
                                        color: Colors.black54)),
                                SizedBox(height: 20),
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  controller: passwordController,
                                  obscureText: !passwordVisible,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
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
                                    hintText: "Password",
                                    hintStyle: GoogleFonts.montserratAlternates(
                                        color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgetPassowrd()),
                                              (route) => false);
                                        },
                                        child: Text("Forgot your password?",
                                            style: GoogleFonts
                                                .montserratAlternates(
                                                    color: Colors.black54)),
                                      )
                                    ]),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                    width: 280,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                            if (emailController.text.isEmpty &&
                                                passwordController
                                                    .text.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text("Fields are Empty"),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                            if (emailController
                                                    .text.isNotEmpty &&
                                                passwordController
                                                    .text.isNotEmpty) {
                                              setState(() {
                                                isLoading = true;
                                              });
                                            }

                                            dynamic result = await AuthService()
                                                .login(emailController.text,
                                                    passwordController.text);

                                            // Navigator.pushAndRemoveUntil(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             HomeScreen()),
                                            //     (route) => false);

                                            if (result != null) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()),
                                                  (route) => false);
                                            }
                                          },
                                          child: Text("LOGIN",
                                              style: GoogleFonts
                                                  .montserratAlternates(
                                                      fontSize: 16)),
                                          style: ElevatedButton.styleFrom(
                                              elevation: 10,
                                              primary: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account?",
                                          style:
                                              GoogleFonts.montserratAlternates(
                                                  fontSize: 13,
                                                  color: Colors.black)),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScren()),
                                              (route) => false);
                                        },
                                        child: Text("Sign Up",
                                            style: GoogleFonts
                                                .montserratAlternates(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                      )
                                    ])
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
    );
  }
}
