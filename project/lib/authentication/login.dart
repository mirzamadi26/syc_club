import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/homeController.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/forgetpassword.dart';
import 'package:project/authentication/signup.dart';
import 'package:project/database/authservice.dart';

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
                                      builder: (context) => AuthHome()));
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
                          child: Text("Login",
                              style: GoogleFonts.montserratAlternates(
                                  fontSize: text * 15, color: Colors.black)),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: width / 1.7,
                            child: Column(
                              children: [
                                Text("Add your details to login",
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
                                SizedBox(height: height / 40),
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
                                SizedBox(height: height / 80),
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
                                  height: height / 30,
                                ),
                                SizedBox(
                                    width: width / 1.7,
                                    height: height / 15,
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

                                            var result = await AuthService()
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
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Email or password is incorrect"),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                          },
                                          child: Text("LOGIN",
                                              style: GoogleFonts
                                                  .montserratAlternates(
                                                      fontSize: text * 15)),
                                          style: ElevatedButton.styleFrom(
                                              elevation: 10,
                                              primary: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                    )),
                                SizedBox(height: height / 35),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account?",
                                          style:
                                              GoogleFonts.montserratAlternates(
                                                  fontSize: text * 12,
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
