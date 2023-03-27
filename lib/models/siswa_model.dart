class siswa_model {
  final id, nisn, nis, nama, alamat, telp;
  siswa_model({
    this.id,
    this.nisn,
    this.nis,
    this.nama,
    this.alamat,
    this.telp});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "nisn": nisn,
        "nis": nis,
        "nama": nama,
        "alamat": alamat,
        "telp": telp,
      };
    }
  
}