// import 'package:flutter/material.dart';


// class Siswa extends StatelessWidget {
//   const Siswa({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Siswa'),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text('Page siswa')
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:ffi';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screans/siswa_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const Siswa());
}

class Siswa extends StatelessWidget {
  const Siswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SiswaPage(),
    );
  }
}

