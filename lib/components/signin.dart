// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebaybiting_app/components/productpost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SIGNIN {
  static Future signin(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.uid.isNotEmpty) {}
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        print('The password provided is too weak.');
      } else if (e.code == "email-already-in-use") {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('The account already exists for that email.');
    }
  }
}
