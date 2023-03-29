import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spp/controllers/spp_controller.dart';
import 'package:spp/models/spp_model.dart';
import 'add_edit_spp.dart';

class SppPage extends StatefulWidget{
  const SppPage({super.key});

  @override
  State<SppPage> createState() => _SppPage();
}



class _SppPage extends State<SppPage>{
  final CollectionReference _spp = 
  FirebaseFirestore.instance.collection("spp"); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => ManageSpp())));
        },
      child: Icon(Icons.add),
      ),
      appBar: AppBar(
      title:  Text('Data SPP'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child:Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _spp.snapshots(),
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
                                    final spp = spp_model(
                                      id: records.id,
                                      tahun: records["tahun"],
                                      nominal: records["nominal"],
                                    );
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: ((context) => 
                                    ManageSpp(
                                      spp: spp,
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
                                    spp_controller sp_controller;
                                    spp_controller().delete_spp(spp_model(id: records.id));
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
                              title: Text(records["tahun"]),
                              subtitle: Text(records["nominal"]),
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