import 'package:bitirme_projesi_php_flutter/data/entity/basket_product.dart';

class BasketProductResponse{
  List<BasketProduct> basketProducts;
  int success;

  BasketProductResponse({required this.basketProducts,required this.success});

  factory BasketProductResponse.fromJson(Map<String,dynamic>json){
    var jsonArray = json["sepet_yemekler"] as List;
    int success = json["success"] as int;

    var basketProducts = jsonArray.map((jsonArrayNesnesi) => BasketProduct.fromJson(jsonArrayNesnesi)).toList();

    return BasketProductResponse(basketProducts: basketProducts, success: success);
  }
}