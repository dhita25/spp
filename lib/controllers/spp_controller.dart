import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp/models/spp_model.dart';
import 'package:spp/models/spp_model.dart';

final CollectionReference _spp = FirebaseFirestore.instance.collection("spp");
class spp_controller {

  //add data to firebase
  Future add_spp(spp_model spp)async{
    await _spp.doc().set(spp.add_data());
  }

  //update date
  Future update_spp(spp_model spp)async {
    await _spp.doc(spp.id).update(spp.add_data());
  }

  //delete data
  Future delete_spp(spp_model spp) async{
    await _spp.doc(spp.id).delete();
  }
}