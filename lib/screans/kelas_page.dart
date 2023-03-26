import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spp/controllers/kelas_controller.dart';
import 'package:spp/models/kelas_model.dart';
import 'package:spp/screans/add_edit_kelas.dart';

class KelasPage extends StatefulWidget{
  const KelasPage({super.key});

  @override
  State<KelasPage> createState() => _KelasPage();
}



class _KelasPage extends State<KelasPage>{
  final CollectionReference _kelas = 
  FirebaseFirestore.instance.collection("kelas"); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => ManageKelas())));
        },
      child: Icon(Icons.person),
      ),
      appBar: AppBar(
      title:  Text('Data Kelas'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child:Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _kelas.snapshots(),
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
                                    final kelas = kelas_model(
                                      id: records.id,
                                      nama_kelas: records["nama_kelas"],
                                      kompetensi_keahlian: records["kompetensi_keahlian"],
                                    );
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: ((context) => 
                                    ManageKelas(
                                      kelas: kelas,
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
                                    kelas_controller kl_controller;
                                    kelas_controller().delete_kelas(kelas_model(id: records.id));
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
                              title: Text(records["kompetensi_keahlian"]),
                              subtitle: Text(records["nama_kelas"]),
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