class kelas_model {
  final id, kompetensi_keahlian, nama_kelas;
  kelas_model({
    this.id,
    this.kompetensi_keahlian, 
    this.nama_kelas});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "kompetensi_keahlian": kompetensi_keahlian,
        "nama_kelas": nama_kelas
      };
    }
  
}