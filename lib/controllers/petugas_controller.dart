import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/models/petugas_model.dart';

final CollectionReference _petugas = FirebaseFirestore.instance.collection("petugas");
class petugas_controller {

  //add data to firebase
  Future add_petugas(petugas_model petugas)async{
    await _petugas.doc().set(petugas.add_data());
  }

  //update date
  Future update_petugas(petugas_model petugas)async {
    await _petugas.doc(petugas.id).update(petugas.add_data());
  }

  //delete data
  Future delete_petugas(petugas_model petugas) async{
    await _petugas.doc(petugas.id).delete();
  }
}