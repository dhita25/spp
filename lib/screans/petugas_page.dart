import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spp/controllers/petugas_controller.dart';
import 'package:spp/models/petugas_model.dart';
import 'package:spp/screans/add_edit_petugas.dart';

class PetugasPage extends StatefulWidget{
  const PetugasPage({super.key});

  @override
  State<PetugasPage> createState() => _PetugasPage();
}



class _PetugasPage extends State<PetugasPage>{
  final CollectionReference _petugas= 
  FirebaseFirestore.instance.collection("petugas"); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: ((context) => ManagePetugas())));
      //   },
      // child: Icon(Icons.person),
      // ),
      appBar: AppBar(
      title:  Text('Data Petugas'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child:Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _petugas.snapshots(),
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
                                    final petugas = petugas_model(
                                      id: records.id,
                                      email: records["email"],
                                      nama_petugas: records["nama_petugas"],
                                      password: records["password"],
                                    );
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: ((context) => 
                                    ManagePetugas(
                                      petugas: petugas,
                                      index: index,
                                    )
                                    )));
                                  },
                                  icon: Icons.edit_note,
                                  backgroundColor: Colors.blue,
                                  ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    petugas_controller pt_controller;
                                    petugas_controller().delete_petugas(petugas_model(id: records.id));
                                  },
                                  icon: Icons.delete_outline,
                                  backgroundColor: Colors.red,
                                  ),
                              ],
                            ),
                            child: ListTile(
                              tileColor: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                              title: Text(records["nama_petugas"]),
                              subtitle: Text(records["email"]),
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