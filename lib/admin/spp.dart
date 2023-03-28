import 'dart:ffi';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spp/petugas.dart';
import 'package:spp/screans/spp_page.dart';
import '../screans/petugas_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const Spp());
}

class Spp extends StatelessWidget {
  const Spp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SppPage(),
    );
  }
}

