import 'package:bitirme_projesi_php_flutter/data/entity/basket_product.dart';
import 'package:bitirme_projesi_php_flutter/data/repo/basketDao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketCubit extends Cubit<List<BasketProduct>>{
  BasketCubit() : super(<BasketProduct>[]);

  var bRepo = BasketDaoRepository();

  Future<void> getBasketProducts(String kullanici_adi)async{
    var list = await bRepo.getBasketProduct(kullanici_adi);
    emit(list);
  }
}