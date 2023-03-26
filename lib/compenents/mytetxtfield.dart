// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final labledtext, hintedtex;
  final TextEditingController mycontroller;

  MyTextField({
      required this.labledtext,
      required this.hintedtex,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if(value!.isEmpty){
          return "the $labledtext is required ";
        }
      },
      decoration:  InputDecoration(
        labelText: labledtext,
        hintText: hintedtex,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.blue, 
          )),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.blue)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.red)),
      )
    );
  }
}