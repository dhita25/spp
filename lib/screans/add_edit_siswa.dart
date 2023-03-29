import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:spp/controllers/kelas_controller.dart';
//import 'package:spp/models/kelas_model.dart';
import 'package:spp/controllers/siswa_controller.dart';
import 'package:spp/models/siswa_model.dart';
import '../compenents/mytetxtfield.dart';
import 'package:spp/compenents/dropdown.dart';

class ManageSiswa extends StatefulWidget {
  final siswa_model? siswa;
  final index;
  ManageSiswa({this.siswa, this.index});

  @override
  State<ManageSiswa> createState() => _ManageSiswaState();
}

class _ManageSiswaState extends State<ManageSiswa> {
  final _form_key = GlobalKey<FormState>();
  bool iseditingmode = false;
  final TextEditingController id= TextEditingController();
  final TextEditingController nisn= TextEditingController();
  final TextEditingController nis= TextEditingController();
  final TextEditingController nama= TextEditingController();
  final TextEditingController alamat= TextEditingController();
  final TextEditingController telp= TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index != null){
      iseditingmode = true;
      id.text = widget.siswa?.id;
      nisn.text = widget.siswa?.nisn;
      nis.text = widget.siswa?.nis;
      nama.text = widget.siswa?.nama;
      alamat.text = widget.siswa?.alamat;
      telp.text = widget.siswa?.telp;
    }else{
      iseditingmode = false;

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: iseditingmode == true 
      ?  Text("Edit Siswa") 
      :  Text("Add Siswa")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: 
                iseditingmode == true
                ? const Text(
                  "EDIT SISWA", 
                  style: TextStyle(fontSize: 28),
                  selectionColor: Colors.black,
                  )
                : const Text(
                  "ADD SISWA", 
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    ),
                  ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _form_key,
                  child: Column(
                    children: [
                      MyTextField(
                        hintedtex: "example: 1974784782", 
                        labledtext: "NISN", 
                        mycontroller: nisn,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: 202179247", 
                        labledtext: "NIS", 
                        mycontroller: nis,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: Bayu Andra", 
                        labledtext: "Nama", 
                        mycontroller: nama,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: Jalan Buah Batu", 
                        labledtext: "Alamat", 
                        mycontroller: alamat,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: 08953759", 
                        labledtext: "Telepon", 
                        mycontroller: telp,),
                      const SizedBox(height: 10),
                    ],
                )),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                if(_form_key.currentState!.validate()){
                  _form_key.currentState!.save();
                      if(iseditingmode == true){
                        siswa_controller().update_siswa(
                          siswa_model( 
                            id: id.text,
                            nisn: nisn.text, 
                            nis: nis.text, 
                            nama: nama.text, 
                            alamat: alamat.text, 
                            telp: telp.text));
                      }else{
                        siswa_controller().add_siswa(
                          siswa_model( 
                            nisn: nisn.text, 
                            nis: nis.text, 
                            nama: nama.text, 
                            alamat: alamat.text, 
                            telp: telp.text));
                      }
                }
                Navigator.pop(context);
              }, child: iseditingmode == true ? Text("Update") : Text("Simpan") )

            ],),
        )),
    );
  }
}

