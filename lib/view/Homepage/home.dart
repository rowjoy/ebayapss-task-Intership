// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebaybiting_app/animation/animationrouts.dart';
import 'package:ebaybiting_app/view/Homepage/productdetels.dart';
import 'package:ebaybiting_app/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  static const String path = 'Homepage';
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Searchbar(),
          ),
          preferredSize: Size.fromHeight(50),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('Bidproduct').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Internet Problem');
                }
                if (!snapshot.hasData) {
                  return Text('${snapshot.hasData}');
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  List<DocumentSnapshot> productlist = snapshot.data!.docs;
                  return Container(
                    child: ListView.builder(
                        itemCount: productlist.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 1 / 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                child: Image.network(
                                    productlist[index]['productimage']),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Minimam price\$',
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                productlist[index]
                                                    ['Productprice'],
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.red,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                createdroute(
                                                  ProductDetels(
                                                    image: productlist[index]
                                                        ['productimage'],
                                                    productname:
                                                        productlist[index]
                                                            ['Productname'],
                                                    productprice:
                                                        productlist[index]
                                                            ['Productprice'],
                                                    productdiscrption:
                                                        productlist[index]
                                                            ['productdis'],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text('BID NOW'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                }
                return Text('Lodding..');
              },
            ),
          ),
        ),
      ),
    );
  }
}
