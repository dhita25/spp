import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/models/kelas_model.dart';

final CollectionReference _kelas = FirebaseFirestore.instance.collection("kelas");
class kelas_controller {

  //add data to firebase
  Future add_kelas(kelas_model kelas)async{
    await _kelas.doc().set(kelas.add_data());
  }

  //update date
  Future update_kelas(kelas_model kelas)async {
    await _kelas.doc(kelas.id).update(kelas.add_data());
  }

  //delete data
  Future delete_kelas(kelas_model kelas) async{
    await _kelas.doc(kelas.id).delete();
  }
}