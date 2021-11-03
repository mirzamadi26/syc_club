import 'package:flutter/material.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/login.dart';

class SignUpScren extends StatefulWidget {
  SignUpScren({Key? key}) : super(key: key);

  @override
  _SignUpScrenState createState() => _SignUpScrenState();
}

class _SignUpScrenState extends State<SignUpScren> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                                builder: (context) => LoginScreen()));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 14,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 90,
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
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
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
                            style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 20),
                        TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.account_box_outlined,
                                color: Colors.black, size: 26),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Your Name",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
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
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Your Email",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password,
                                color: Colors.black, size: 26),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 280,
                            height: 50,
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
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                        (route) => false);
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      primary: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)))),
                            )),
                        SizedBox(height: 20),
                        Text(
                          "Or Register with",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "OTP",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
