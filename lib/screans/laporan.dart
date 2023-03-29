// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:csv/csv.dart';
// import 'package:path_provider/path_provider.dart';



// Future<void> exportFirestoreDataToCSV() async {
//   // dapatkan referensi ke tabel model di Firestore
//   final collectionRef = FirebaseFirestore.instance.collection('pembayaran');

//   // dapatkan data dari tabel model
//   final querySnapshot = await collectionRef.get();

//   // konversi data ke format CSV
//   final csv = ListToCsvConverter().convert(
//     querySnapshot.docs.map((doc) => [doc['nisn'], doc['jumlah_bayar'], doc['tanggal_bayar']]).toList(),
//   );

//   // dapatkan direktori penyimpanan lokal
//   final directory = await getApplicationDocumentsDirectory();

//   // buat file CSV dan simpan ke direktori penyimpanan lokal
//   final file = File('${directory.path}/data.csv');
//   await file.writeAsString(csv);
// }

