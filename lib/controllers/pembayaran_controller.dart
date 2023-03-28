import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/models/pembayaran_model.dart';
import 'package:spp/models/spp_model.dart';
import 'package:spp/models/spp_model.dart';

final CollectionReference _pembayaran = FirebaseFirestore.instance.collection("pembayaran");
class pembayaran_controller {

  //add data to firebase
  Future add_pembayaran(pembayaran_model pembayaran)async{
    await _pembayaran.doc().set(pembayaran.add_data());
  }

  //update date
  Future update_pembayaran(pembayaran_model pembayaran)async {
    await _pembayaran.doc(pembayaran.id).update(pembayaran.add_data());
  }

  //delete data
  Future delete_pembayaran(pembayaran_model pembayaran) async{
    await _pembayaran.doc(pembayaran.id).delete();
  }
}