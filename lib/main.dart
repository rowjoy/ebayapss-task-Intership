import 'package:ebaybiting_app/view/sigin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline6: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: SignInpage.path,
      routes: {
        // ignore: prefer_const_constructors
        SignInpage.path: (context) => SignInpage(),
      },
    );
  }
}
