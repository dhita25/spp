import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spp/controllers/siswa_controller.dart';
import 'package:spp/models/siswa_model.dart';
import 'package:spp/screans/add_edit_siswa.dart';

class SiswaPage extends StatefulWidget{
  const SiswaPage({super.key});

  @override
  State<SiswaPage> createState() => _SiswaPage();
}



class _SiswaPage extends State<SiswaPage>{
  final CollectionReference _siswa= 
  FirebaseFirestore.instance.collection("siswa"); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: ((context) => ManageSiswa())));
      //   },
      // child: Icon(Icons.person),
      // ),
      appBar: AppBar(
      title:  Text('Data Siswa'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child:Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _siswa.snapshots(),
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
                                    final siswa = siswa_model(
                                      id: records.id,
                                      nisn: records["nisn"],
                                      nis: records["nis"],
                                      nama: records["nama"],
                                      alamat: records["alamat"],
                                      kelas: records["kelas"],
                                      telp: records["telp"],
                                    );
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: ((context) => 
                                    ManageSiswa(
                                      siswa: siswa,
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
                                    siswa_controller sw_controller;
                                    siswa_controller().delete_siswa(siswa_model(id: records.id));
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
                              title: Text(records["nama"]),
                              subtitle: Text(records["nis"]),
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