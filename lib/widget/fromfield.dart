// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Formfields extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final int? maxlanth;
  final bool obsettext;
  final TextInputType? keyboardType;
  const Formfields({
    Key? key,
    this.controller,
    this.labelText,
    this.maxlanth,
    required this.obsettext,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: Theme.of(context).textTheme.headline6,
      validator: validator,
      obscureText: obsettext,
      decoration: InputDecoration(
        hintText: labelText,
        labelStyle: Theme.of(context).textTheme.headline6,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        errorStyle: GoogleFonts.montserrat(
          fontSize: 12,
          color: Colors.red,
          letterSpacing: 1,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    );
  }
}
