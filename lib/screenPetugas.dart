import 'package:flutter/cupertino.dart';
import 'petugas/history.dart';
import 'petugas/siswa.dart';
import 'controllers/logout.dart';

List<Widget> screenPetugas(){
  return[
    const dataSiswa(),
    const history(),
  ];
}