class Kisiler {
  String kisi_id;
  String kisi_adi;
  String kisi_tel;

  Kisiler({
    required this.kisi_id,
    required this.kisi_adi,
    required this.kisi_tel});

  factory Kisiler.fromJson(Map<dynamic , dynamic> json ,String key){
     return Kisiler(
         kisi_id: key,
         kisi_adi: json["kisi_adi"] as String,
         kisi_tel: json["kisi_tel"] as String,
     );
  }

}