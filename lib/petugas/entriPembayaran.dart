import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/controllers/pembayaran_controller.dart';
import 'package:spp/models/kelas_model.dart';
import 'package:spp/models/pembayaran_model.dart';
import '../compenents/mytetxtfield.dart';

class ManageEntri extends StatefulWidget {
  final pembayaran_model? pembayaran;
  final index;
  ManageEntri({this.pembayaran, this.index});

  @override
  State<ManageEntri> createState() => _ManageEntriState();
}

class _ManageEntriState extends State<ManageEntri> {
  final _form_key = GlobalKey<FormState>();
  bool iseditingmode = false;
  final TextEditingController id= TextEditingController();
  final TextEditingController nis= TextEditingController();
  final TextEditingController jumlah_bayar= TextEditingController();
  final TextEditingController tanggal_bayar= TextEditingController();
  final TextEditingController bulan_bayar= TextEditingController();
  final TextEditingController tahun_bayar= TextEditingController();
  final TextEditingController status= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index != null){
      iseditingmode = true;
      id.text = widget.pembayaran?.id;
      nis.text = widget.pembayaran?.nis;
      jumlah_bayar.text = widget.pembayaran?.jumlah_bayar;
      tanggal_bayar.text = widget.pembayaran?.tanggal_bayar;
      bulan_bayar.text = widget.pembayaran?.bulan_bayar;
      tahun_bayar.text = widget.pembayaran?.tahun_bayar;
      status.text = widget.pembayaran?.status;
    }else{
      iseditingmode = false;

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Detail pembayaran'),
      //   backgroundColor: Colors.blueGrey[900],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: 
                iseditingmode == true
                ? const Text(
                  "DETAIL PEMBAYARAN", 
                  style: TextStyle(fontSize: 28),
                  selectionColor: Colors.black,
                  )
                : const Text(
                  "ENTRI PEMBAYARAN", 
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
                        hintedtex: "example: 20218957", 
                        labledtext: "NIS", 
                        mycontroller: nis,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: 70000", 
                        labledtext: "jumlah bayar", 
                        mycontroller: jumlah_bayar,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: tanggal sekarang", 
                        labledtext: "tanggal bayar", 
                        mycontroller: tanggal_bayar,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: januari", 
                        labledtext: "bulan bayar", 
                        mycontroller: bulan_bayar,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example:2023", 
                        labledtext: "Tahun Bayar", 
                        mycontroller: tahun_bayar,),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtex: "example: Lunas / Tunggakan 100000", 
                        labledtext: "status", 
                        mycontroller: status,),
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
                        pembayaran_controller().update_pembayaran(
                          pembayaran_model( 
                            id: id.text,
                            nis: nis.text,
                            jumlah_bayar: jumlah_bayar.text, 
                            tanggal_bayar: tanggal_bayar.text, 
                            bulan_bayar: bulan_bayar.text, 
                            tahun_bayar: tahun_bayar.text, 
                            status: status.text));
                      }
                      else{
                        pembayaran_controller().add_pembayaran(
                          pembayaran_model( 
                            nis: nis.text,
                            jumlah_bayar: jumlah_bayar.text, 
                            tanggal_bayar: tanggal_bayar.text, 
                            bulan_bayar: bulan_bayar.text, 
                            tahun_bayar: tahun_bayar.text, 
                            status: status.text));
                      }
                }
                
              }, child: iseditingmode == true ? Text("update") : Text("simpan") )

            ],),
        )),
    );
  }
}

