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
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        User? emailVerify;
        return emailVerify;
      }
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

  Future<bool> checkEmail(String email) async {
    var result = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    result.then((value) {
      if (value.docs.length != 0) {
        return false;
      } else
        return true;
    });
    return false;
  }
}
