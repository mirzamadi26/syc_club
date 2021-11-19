import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/authentication/login.dart';
import 'package:project/authentication/signup.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);

    print(size);
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: height / 40),
                Image.asset(
                  'assets/logo.png',
                  width: width / 3.4,
                ),
                SizedBox(height: 20),
                Text("Syrian Youth Club",
                    style: GoogleFonts.montserratAlternates(
                      fontSize: text * 17,
                    )),
                SizedBox(
                  height: height / 3,
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
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          },
                          child: Text("LOGIN",
                              style: GoogleFonts.montserratAlternates(
                                fontSize: text * 15,
                              )),
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                    )),
                SizedBox(height: 20),
                SizedBox(
                  height: height / 15,
                  width: width / 1.7,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScren()),
                              (route) => false);
                        },
                        child: Text("Create an Account",
                            style: GoogleFonts.montserratAlternates(
                                fontSize: text * 15, color: Colors.black54)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            side: BorderSide(width: 2, color: Colors.black))),
                  ),
                ),
              ]),
            )));
  }
}
