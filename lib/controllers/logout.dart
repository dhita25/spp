import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp/login.dart';

Future<void> logout(BuildContext context) async{
  CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context, 
    MaterialPageRoute(
      builder: (context) => LoginPage(),
      ),
      );
}