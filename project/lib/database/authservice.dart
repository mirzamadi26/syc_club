import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Register User

  Future<User?> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(name);
      final user = userCredential.user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  // Login User
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future logOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
