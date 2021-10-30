// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:ebaybiting_app/animation/animationrouts.dart';
import 'package:ebaybiting_app/components/signup.dart';
import 'package:ebaybiting_app/view/Homepage/homescreen.dart';
import 'package:ebaybiting_app/widget/fromfield.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class SignUppage extends StatefulWidget {
  static const String path = "SignUppage";
  const SignUppage({Key? key}) : super(key: key);

  @override
  _SignInpageState createState() => _SignInpageState();
}

class _SignInpageState extends State<SignUppage> {
  bool showpassword = true;
  var fromkey = GlobalKey<FormState>();
  TextEditingController nameconteroller = TextEditingController();
  TextEditingController emaiconteroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Please registration',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: fromkey,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Formfields(
                        controller: nameconteroller,
                        prefixIcon: Icon(Icons.person,
                            color: Colors.black.withOpacity(0.8)),
                        labelText: 'Your Name',
                        obsettext: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Please enter Your name');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Formfields(
                        controller: emaiconteroller,
                        prefixIcon: Icon(Icons.email,
                            color: Colors.black.withOpacity(0.8)),
                        labelText: 'Your Email',
                        obsettext: false,
                        validator: (value) {
                          if (!EmailValidator.validate(value!)) {
                            return ('Please enter your valid email');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Formfields(
                        controller: passwordcontroller,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        obsettext: showpassword,
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showpassword = !showpassword;
                            });
                          },
                          child: Icon(
                            showpassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return ('please type 8 key');
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (fromkey.currentState!.validate()) {
                                    fromkey.currentState!.save();
                                    SigUp.registration(
                                      emaiconteroller.text,
                                      passwordcontroller.text,
                                      nameconteroller.text,
                                    );
                                    Navigator.push(
                                        context, createdroute(HomeScreen()));
                                  }
                                });
                                emaiconteroller.clear();
                                passwordcontroller.clear();
                                nameconteroller.clear();
                              },
                              child: Text('SUBMIT')),
                        ),
                      )
                    ],
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
