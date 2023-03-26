import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/models/kelas_model.dart';
import '../compenents/mytetxtfield.dart';

class ManageKelas extends StatefulWidget {
  final kelas_model? kelas;
  final index;
  ManageKelas({this.kelas, this.index});

  @override
  State<ManageKelas> createState() => _ManageKelasState();
}

class _ManageKelasState extends State<ManageKelas> {
  final _form_key = GlobalKey<FormState>();
  bool iseditingmode = false;
  final TextEditingController id= TextEditingController();
  final TextEditingController nama_kelas= TextEditingController();
  final TextEditingController kompetensi_keahlian= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index != null){
      iseditingmode = true;
      id.text = widget.kelas?.id;
      nama_kelas.text = widget.kelas?.nama_kelas;
      kompetensi_keahlian.text = widget.kelas?.kompetensi_keahlian;
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
      ?  Text("Edit Kelas") 
      :  Text("Add Kelas")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: 
                iseditingmode == true
                ? const Text(
                  "EDIT KELAS", 
                  style: TextStyle(fontSize: 28),
                  selectionColor: Colors.black,
                  )
                : const Text(
                  "ADD KELAS", 
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
                        hintedtex: "example: RPL", 
                        labledtext: "Kompentensi Keahlian", 
                        mycontroller: kompetensi_keahlian,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: 12 RPL 2", 
                        labledtext: "Nama Kelas", 
                        mycontroller: nama_kelas,),
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
                        kelas_controller().update_kelas(
                          kelas_model( 
                            id: id.text,
                            kompetensi_keahlian: kompetensi_keahlian.text, 
                            nama_kelas: nama_kelas.text));
                      }else{
                        kelas_controller().add_kelas(
                          kelas_model( 
                            kompetensi_keahlian: kompetensi_keahlian.text, 
                            nama_kelas: nama_kelas.text));
                      }
                }
                Navigator.pop(context);
              }, child: iseditingmode == true ? Text("Update") : Text("Simpan") )

            ],),
        )),
    );
  }
}

