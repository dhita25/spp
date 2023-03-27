import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/models/siswa_model.dart';

final CollectionReference _siswa = FirebaseFirestore.instance.collection("siswa");
class siswa_controller {

  //add data to firebase
  Future add_siswa(siswa_model siswa)async{
    await _siswa.doc().set(siswa.add_data());
  }

  //update date
  Future update_siswa(siswa_model siswa)async {
    await _siswa.doc(siswa.id).update(siswa.add_data());
  }

  //delete data
  Future delete_siswa(siswa_model siswa) async{
    await _siswa.doc(siswa.id).delete();
  }
}