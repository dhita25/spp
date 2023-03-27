// import 'dart:html';

// import "package:cloud_firestore/cloud_firestore.dart";
// import 'package:flutter/material.dart';

// class KelasDropdown extends StatefulWidget{
//   @override
//   _KelasDropdownState createState() => _KelasDropdownState();
// } 

// class _KelasDropdownState extends State<KelasDropdown>{
//   String selectedKelas;
//   List<String> kelasList = [];

//   @override
//   void initState(){
//     super.initState();
//     getKelasList();
//   }

//   void getKelasList() async {
//     QuerySnapshot querySnapshot =
//     await FirebaseFirestore.instance.collection('kelas').get();
//     List<DocumentSnapshot> documentList = querySnapshot.docs;
//     setState(() {
//       kelasList = documentList.map((doc) => doc['nama_kelas']).toList();
//     });
//   }
  
//   @override
//   Widget build(BuildContext context){
//     return DropdownButton<String>(
//       value: selectedKelas,
//       items: kelasList.map((String kelas){
//         return DropdownMenuItem<Strinng>(
//           value: kelas,
//           child: Text(kelas),
//         );
//       }).toList(), 
//       onChanged: (String newValue){
//         setState(() {
//           selectedKelas = newValue;
//         });
//       },);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/models/kelas_model.dart';

class KelasDropdown extends StatefulWidget {
  @override
  _KelasDropdownState createState() => _KelasDropdownState();
}

class _KelasDropdownState extends State<KelasDropdown> {
  String? selectedKelas;
  List<dynamic> kelasList = [];

  @override
  void initState() {
    super.initState();
    getKelasList();
  }

  void getKelasList() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('kelas').get();
    List<DocumentSnapshot> documentList = querySnapshot.docs;
    setState(() {
      kelasList = documentList.map((doc) => doc['nama_kelas']).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedKelas,
      items: kelasList.map((dynamic kelas) {
        return DropdownMenuItem<String>(
          value: kelas,
          child: Text(kelas),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedKelas = newValue;
        });
      },
    );
  }
}
