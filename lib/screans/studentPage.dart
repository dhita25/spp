import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spp/models/pembayaran_model.dart';
import 'package:spp/admin/entri.dart';

class StudentPage extends StatefulWidget{
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPage();
}



class _StudentPage extends State<StudentPage>{
  final CollectionReference _pembayaran = 
  FirebaseFirestore.instance.collection("pembayaran"); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title:  Text('History'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child:Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _pembayaran.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if(snapshots.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(color: Colors.orange[400]),
                      );
                    }
                    
                    if(snapshots.hasData){
                      return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index){
                          final DocumentSnapshot records = 
                          snapshots.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Slidable(
                            startActionPane: ActionPane(
                              motion: StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context){
                                    final pembayaran = pembayaran_model(
                                      id: records.id,
                                      nis: records["nis"],
                                      jumlah_bayar: records["jumlah_bayar"],
                                      tanggal_bayar: records["tanggal_bayar"],
                                      bulan_bayar: records["bulan_bayar"],
                                      tahun_bayar: records["tahun_bayar"],
                                      status: records["status"],
                                    );
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: ((context) => 
                                    ManagePembayaran(
                                      pembayaran: pembayaran,
                                      index: index,
                                    )
                                    )));
                                  },
                                  icon: Icons.info,
                                  backgroundColor: Colors.blue,
                                  ),
                              ],
                            ),
                            // endActionPane: ActionPane(
                            //   motion: StretchMotion(),
                            //   children: [
                            //     SlidableAction(
                            //       onPressed: (context) {
                            //         pembayaran_controller pb_controller;
                            //         pembayaran_controller().delete_pembayaran(pembayaran_model(id: records.id));
                            //       },
                            //       icon: Icons.delete_outline,
                            //       backgroundColor: Colors.red,
                            //       ),
                            //   ],
                            // ),
                            child: ListTile(
                              tileColor: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                              title: Text(records["tanggal_bayar"]),
                              subtitle: Text(records["jumlah_bayar"]),
                            ), 
                          ),
                        );
                      });
                    }else{}

                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),
              ),
            ],
            )),
      );
  }
}