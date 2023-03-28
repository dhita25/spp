class siswa_model {
  final id, nisn, nis, nama, alamat, telp, kelas;
  siswa_model({
    this.id,
    this.nisn,
    this.nis,
    this.nama,
    this.alamat,
    this.kelas,
    this.telp});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "nisn": nisn,
        "nis": nis,
        "nama": nama,
        "alamat": alamat,
        "kelas" : kelas,
        "telp": telp,
      };
    }
  
}