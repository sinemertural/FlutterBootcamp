import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/basket_product.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/basket_product_response.dart';

class BasketDaoRepository{

  List<BasketProduct> parseBasketProducts(String response){
    return BasketProductResponse.fromJson(json.decode(response)).basketProducts;
  }

  Future<void> addToBasket(
      String yemek_adi,
      String yemek_resim_adi,
      int yemek_fiyat ,
      int yemek_siparis_adet ,
      String kullanici_adi) async{

    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var data = {
      "yemek_adi" : yemek_adi,
      "yemek_resim_adi" : yemek_resim_adi,
      "yemek_fiyat" : yemek_fiyat,
      "yemek_siparis_adet" : yemek_siparis_adet,
      "kullanici_adi" : kullanici_adi
    };
    var response = await Dio().post(url,data: FormData.fromMap(data));
    print("Ürün sepete eklendi : ${response.data.toString()}");

  }

  Future<List<BasketProduct>> getBasketProduct(String kullanici_adi ) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var data = {"kullanici_adi": kullanici_adi};
    var response = await Dio().post(url,data: FormData.fromMap(data));
    return parseBasketProducts(response.data.toString());

  }
}