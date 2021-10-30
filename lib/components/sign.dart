// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SigIN {
  static Future registration(email, password, name) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.uid.isNotEmpty) {
        FirebaseAuth _auth = FirebaseAuth.instance;
        var user = _auth.currentUser;
        CollectionReference appusers =
            FirebaseFirestore.instance.collection('User-Profile-info');
        appusers.doc(user!.email).set({
          "Username": name,
          "User-Phone-Number": null,
          "user-profile-Photo": null,
        });
      }
    } on FirebaseAuthException catch (value) {
      if (value.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (value.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Erro");
    }
  }
}
