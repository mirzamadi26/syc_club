import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/database/authservice.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return HomeScreen();
    } else {
      return AuthHome();
    }
  }
}
