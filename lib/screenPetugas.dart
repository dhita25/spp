import 'package:flutter/cupertino.dart';
import 'package:spp/admin/entri.dart';
import 'petugas/history.dart';
import 'petugas/entriPembayaran.dart';
import 'controllers/logout.dart';
import 'admin/entri.dart';
List<Widget> screenPetugas(){
  return[
    ManageEntri(),
    PembayaranPage(),
  ];
}