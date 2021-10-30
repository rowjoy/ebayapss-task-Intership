// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:ebaybiting_app/widget/bidtingproduct.dart';
import 'package:ebaybiting_app/widget/searchbar.dart';
import 'package:flutter/material.dart';

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
            child: BidtingProduct(
              endTime:
                  DateTime(2022, 10, 22, 12, 48, 00).millisecondsSinceEpoch,
              image:
                  'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW90b3JiaWtlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
              price: '200',
            ),
          ),
        ),
      ),
    );
  }
}
