// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebaybiting_app/components/biduserinfo.dart';
import 'package:ebaybiting_app/widget/fromfield.dart';
import 'package:flutter/material.dart';

class ProductDetels extends StatefulWidget {
  final String? image;
  final String? productname;
  final String? productprice;
  final String? productdiscrption;
  const ProductDetels(
      {Key? key,
      this.image,
      this.productname,
      this.productprice,
      this.productdiscrption})
      : super(key: key);

  @override
  _ProductDetelsState createState() => _ProductDetelsState();
}

class _ProductDetelsState extends State<ProductDetels> {
  TextEditingController nameconteroller = TextEditingController();
  TextEditingController phoneconteroller = TextEditingController();
  TextEditingController priceconteroller = TextEditingController();
  var fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(widget.image!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          widget.productname!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Price\$ ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          widget.productprice!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          widget.productdiscrption!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.productprice!;
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 500,
                            child: Column(
                              children: [
                                Text(
                                  'Bid Now',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SingleChildScrollView(
                                  child: Form(
                                      key: fromkey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          children: [
                                            Formfields(
                                              controller: nameconteroller,
                                              prefixIcon: Icon(Icons.person,
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                              labelText: 'Your Name',
                                              obsettext: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ('Please enter Your name');
                                                }
                                              },
                                            ),
                                            Formfields(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: phoneconteroller,
                                              prefixIcon: Icon(Icons.person,
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                              labelText: 'Phone Number',
                                              obsettext: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ('Please enter contect number');
                                                }
                                              },
                                            ),
                                            Formfields(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: priceconteroller,
                                              prefixIcon: Icon(Icons.person,
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                              labelText:
                                                  'Mini bid price \$${widget.productprice!}',
                                              obsettext: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ('Please enter minemun price');
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    if (fromkey.currentState!
                                                        .validate()) {
                                                      fromkey.currentState!
                                                          .save();
                                                      BITUSER.bituseringo(
                                                          nameconteroller.text,
                                                          phoneconteroller.text,
                                                          priceconteroller
                                                              .text);
                                                      nameconteroller.clear();
                                                      phoneconteroller.clear();
                                                      priceconteroller.clear();
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Text("BID DONE")),
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('BID NOW'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
