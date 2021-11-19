import 'package:flutter/material.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/authentication/authentication.dart';
import 'package:project/authentication/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(home: Authentication()));
}
