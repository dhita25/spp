import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/controllers/petugas_controller.dart';
import 'package:spp/models/petugas_model.dart';
import '../compenents/mytetxtfield.dart';
import 'package:spp/compenents/dropdown.dart';

class ManagePetugas extends StatefulWidget {
  final petugas_model? petugas;
  final index;
  ManagePetugas({this.petugas, this.index});

  @override
  State<ManagePetugas> createState() => _ManagePetugasState();
}

class _ManagePetugasState extends State<ManagePetugas> {
  final _form_key = GlobalKey<FormState>();
  bool iseditingmode = false;
  final TextEditingController id= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController nama_petugas= TextEditingController();
  final TextEditingController password= TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index != null){
      iseditingmode = true;
      id.text = widget.petugas?.id;
      email.text = widget.petugas?.email;
      nama_petugas.text = widget.petugas?.nama_petugas;
      password.text = widget.petugas?.password;
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
      ?  Text("Edit Petugas") 
      :  Text("Add Petugas")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: 
                iseditingmode == true
                ? const Text(
                  "EDIT PETUGAS", 
                  style: TextStyle(fontSize: 28),
                  selectionColor: Colors.black,
                  )
                : const Text(
                  "ADD PETUGAS", 
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
                        hintedtex: "example: petugas@gmail.com", 
                        labledtext: "email", 
                        mycontroller: email,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: Andri", 
                        labledtext: "Nama", 
                        mycontroller: nama_petugas,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: petugas1", 
                        labledtext: "password", 
                        mycontroller: password,),
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
                        petugas_controller().update_petugas(
                          petugas_model( 
                            id: id.text,
                            email: email.text, 
                            nama_petugas: nama_petugas.text, 
                            password: password.text, ));
                      }else{
                        petugas_controller().add_petugas(
                          petugas_model( 
                            email: email.text, 
                            nama_petugas: nama_petugas.text, 
                            password: password.text, ));
                      }
                }
                Navigator.pop(context);
              }, child: iseditingmode == true ? Text("Update") : Text("Simpan") )

            ],),
        )),
    );
  }
}

