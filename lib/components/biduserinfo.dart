import 'package:cloud_firestore/cloud_firestore.dart';

class BITUSER {
  static Future bituseringo(namebit, pnonebit, pricebit) async {
    CollectionReference user =
        FirebaseFirestore.instance.collection('Bid User');
    user
        .doc()
        .set({
          'Bit-User-Name': namebit,
          "Bit-user-number": pnonebit,
          "Bit-price": pnonebit,
        })
        // ignore: avoid_print
        .then((value) => print('All Ok'))
        .catchError((e) {
          // ignore: avoid_print
          print(e);
        });
  }
}
