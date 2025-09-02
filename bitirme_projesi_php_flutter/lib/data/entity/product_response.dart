import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';

class ProductResponse{
  List<Product> products;
  int success;

  ProductResponse({
    required this.products,
    required this.success});

  factory ProductResponse.fromJson(Map<String , dynamic>json){
    var jsonArray = json["yemekler"] as List;
    int success = json["success"] as int;

    var products = jsonArray.map((jsonArrayNesnesi)=> Product.fromJson(jsonArrayNesnesi)).toList();

    return ProductResponse(
    products: products,
    success: success);
  }
}