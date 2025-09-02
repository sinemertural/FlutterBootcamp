import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/product_response.dart';

class ProductDaoRepository{

  List<Product> parseProducts(String response){
    return ProductResponse.fromJson(json.decode(response)).products;
  }

  Future<List<Product>> loadProducts() async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var response = await Dio().get(url);
    return parseProducts(response.data.toString());

  }
}