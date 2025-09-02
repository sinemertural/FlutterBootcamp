import 'dart:ffi';

class Product{
  int yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  int yemek_fiyat;

  Product({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat});

  factory Product.fromJson(Map<String , dynamic> json){
    return Product(
        yemek_id: int.parse(json["yemek_id"]),
        yemek_adi: json["yemek_adi"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_fiyat: int.parse(json["yemek_fiyat"]));
  }
}