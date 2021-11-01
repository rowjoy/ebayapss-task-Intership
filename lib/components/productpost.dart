// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

String? images;

class PRODUCTPOST {
  static Future addproductdatisl(productname, productprice, productdis) async {
    try {
      if (images == null) {
        print('Image Nall');
      } else {
        final ref =
            FirebaseStorage.instance.ref('Product-image').child('$images');
        // ignore: unnecessary_string_interpolations
        await ref.putFile(File(images!));
        var url = await ref.getDownloadURL();

        CollectionReference user =
            FirebaseFirestore.instance.collection('Bidproduct');
        user.doc().set({
          "Productname": productname,
          "Productprice": productprice,
          "productimage": url,
          "productdis": productdis,
        }).then((value) {
          print('Data Add ok');
        }).catchError((e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
