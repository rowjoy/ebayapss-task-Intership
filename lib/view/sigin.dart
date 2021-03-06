// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:ebaybiting_app/animation/animationrouts.dart';
import 'package:ebaybiting_app/components/signin.dart';
import 'package:ebaybiting_app/view/Homepage/homescreen.dart';
import 'package:ebaybiting_app/view/signup.dart';
import 'package:ebaybiting_app/widget/fromfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  static const String path = "SignInpage";
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var fromkey = GlobalKey<FormState>();
  bool showpassword = true;
  TextEditingController emaiconteroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset('images/applogo.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Please Signin',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 30,
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
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Forget password?',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 35),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (fromkey.currentState!.validate()) {
                                  fromkey.currentState!.save();
                                  SIGNIN.signin(
                                    emaiconteroller.text,
                                    passwordcontroller.text,
                                  );
                                  Navigator.push(
                                      context, createdroute(HomeScreen()));
                                  emaiconteroller.clear();
                                  passwordcontroller.clear();
                                }
                              },
                              child: Text('SIGNIN')),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Don\'t have on account ?',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, createdroute(SignUppage()));
                              },
                              child: Text('Sign-Up',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.blueAccent,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
