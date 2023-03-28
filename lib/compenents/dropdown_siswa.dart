import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/models/kelas_model.dart';

class SiswaDropdown extends StatefulWidget {
  @override
  _SiswaDropdownState createState() => _SiswaDropdownState();
}

class _SiswaDropdownState extends State<SiswaDropdown> {
  String? selectedSiswa;
  List<dynamic> siswaList = [];

  @override
  void initState() {
    super.initState();
    getSiswaList();
  }

  void getSiswaList() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('siswa').get();
    List<DocumentSnapshot> documentList = querySnapshot.docs;
    setState(() {
      siswaList = documentList.map((doc) => doc['nis']).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedSiswa,
      items: siswaList.map((dynamic siswa) {
        return DropdownMenuItem<String>(
          value: siswa,
          child: Text(siswa),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedSiswa = newValue;
        });
      },
    );
  }
}
