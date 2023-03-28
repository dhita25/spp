class petugas_model {
  final id, email, nama_petugas, password;
  petugas_model({
    this.id,
    this.email,
    this.nama_petugas,
    this.password,});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "email": email,
        "nama_petugas": nama_petugas,
        "password": password,
      };
    }
  
}