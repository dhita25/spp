class spp_model {
  final id, nominal, tahun;
  spp_model({
    this.id,
    this.nominal, 
    this.tahun});

    //map data to firebase
    Map<String, dynamic> add_data(){
      return{
        "nominal": nominal,
        "tahun": tahun
      };
    }
  
}