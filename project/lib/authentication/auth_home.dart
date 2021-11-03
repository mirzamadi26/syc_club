import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/login.dart';
import 'package:project/authentication/signup.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 90),
              Image.asset(
                'assets/logo.png',
                width: 150,
              ),
              SizedBox(height: 20),
              Text("Syrian Youth Club",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 300,
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
                            colors: [Colors.black, Colors.grey, Colors.black])),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                        child: Text("LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                  )),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 280,
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
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          side: BorderSide(width: 2, color: Colors.black))),
                ),
              ),
            ])));
  }
}
