// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print
import 'dart:io';

import 'package:ebaybiting_app/animation/animationrouts.dart';
import 'package:ebaybiting_app/components/productpost.dart';
import 'package:ebaybiting_app/view/Homepage/homescreen.dart';

import 'package:ebaybiting_app/widget/fromfield.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Productpost extends StatefulWidget {
  const Productpost({Key? key}) : super(key: key);

  @override
  _ProductpostState createState() => _ProductpostState();
}

class _ProductpostState extends State<Productpost> {
  // ignore: prefer_typing_uninitialized_variables
  final ImagePicker _imagePicker = ImagePicker();
  var fromkey = GlobalKey<FormState>();
  TextEditingController productnameconteroller = TextEditingController();
  TextEditingController productpriceconteroller = TextEditingController();
  TextEditingController productdiscriptionconteroller = TextEditingController();

  TextEditingController dmycontroller = TextEditingController();
  @override
  void initState() {
    // uploadproductingo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Container(
                      child: Text('Upload Your Product',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
              Form(
                key: fromkey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Formfields(
                        controller: productnameconteroller,
                        obsettext: false,
                        labelText: 'Product name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Please Enter Product Name');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Formfields(
                        controller: productpriceconteroller,
                        obsettext: false,
                        keyboardType: TextInputType.number,
                        labelText: 'Procuct Price',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Please Enter Product Name');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: dmycontroller,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_today_sharp)),
                          hintText: 'Select bid end time',
                          hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Please Select bid end time');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 40,
                              child: Text(
                                'Please select and Upload Product Image',
                                maxLines: 3,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: images == null
                                  ? Center(
                                      child: Icon(Icons.photo_album),
                                    )
                                  : Image.file(
                                      File(images!),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          filepiker();
                                        },
                                        child: Text('ADD IMAGE'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 7,
                              blurRadius: 0,
                              offset: Offset(0, 7), // Shadow position
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: productdiscriptionconteroller,
                          keyboardType: TextInputType.text,
                          maxLines: 30,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'review field isEmpaty';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Your Product Discription',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (fromkey.currentState!.validate()) {
                        fromkey.currentState!.save();
                        setState(() {
                          PRODUCTPOST.addproductdatisl(
                            productnameconteroller.text,
                            productpriceconteroller.text,
                            productdiscriptionconteroller.text,
                          );
                          Navigator.push(context, createdroute(HomeScreen()));
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void filepiker() async {
    final XFile? selectimage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    print(selectimage!.path);
    setState(() {
      images = selectimage.path;
    });
  }
}
