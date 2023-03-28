import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/controllers/spp_controller.dart';
import 'package:spp/models/kelas_model.dart';
import 'package:spp/models/spp_model.dart';
import '../compenents/mytetxtfield.dart';

class ManageSpp extends StatefulWidget {
  final spp_model? spp;
  final index;
  ManageSpp({this.spp, this.index});

  @override
  State<ManageSpp> createState() => _ManageSppState();
}

class _ManageSppState extends State<ManageSpp> {
  final _form_key = GlobalKey<FormState>();
  bool iseditingmode = false;
  final TextEditingController id= TextEditingController();
  final TextEditingController tahun= TextEditingController();
  final TextEditingController nominal= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index != null){
      iseditingmode = true;
      id.text = widget.spp?.id;
      tahun.text = widget.spp?.tahun;
      nominal.text = widget.spp?.nominal;
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
      ?  Text("Edit SPP") 
      :  Text("Add SPP")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: 
                iseditingmode == true
                ? const Text(
                  "EDIT SPP", 
                  style: TextStyle(fontSize: 28),
                  selectionColor: Colors.black,
                  )
                : const Text(
                  "ADD SPP", 
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
                        hintedtex: "example: 2021", 
                        labledtext: "tahun", 
                        mycontroller: tahun,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: Rp. 7000000", 
                        labledtext: "Nominal", 
                        mycontroller: nominal,),
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
                        spp_controller().update_spp(
                          spp_model( 
                            id: id.text,
                            tahun: tahun.text, 
                            nominal: nominal.text));
                      }else{
                        spp_controller().add_spp(
                          spp_model( 
                            tahun: tahun.text, 
                            nominal: nominal.text));
                      }
                }
                Navigator.pop(context);
              }, child: iseditingmode == true ? Text("Update") : Text("Simpan") )

            ],),
        )),
    );
  }
}

