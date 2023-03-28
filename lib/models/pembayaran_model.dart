class pembayaran_model {
  final id, nis, jumlah_bayar, tanggal_bayar, bulan_bayar, tahun_bayar, status;
  pembayaran_model({
    this.id,
    this.nis,
    this.jumlah_bayar,
    this.tanggal_bayar,
    this.bulan_bayar,
    this.tahun_bayar,
    this.status});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "nis": nis,
        "jumlah_bayar": jumlah_bayar,
        "tanggal_bayar": tanggal_bayar,
        "bulan_bayar": bulan_bayar,
        "tahun_bayar": tahun_bayar,
        "status": status,
      };
    }
  
}