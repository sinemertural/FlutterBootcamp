
import 'package:bitirme_projesi_php_flutter/data/repo/basketDao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DetailCubit extends Cubit<bool> {
  DetailCubit():super(false);

  var bRepo = BasketDaoRepository();

  Future<void> addToCart(
      String yemek_adi,
      String yemek_resim_adi,
      int yemek_fiyat ,
      int yemek_siparis_adet ,
      String kullanici_adi)async{
    await bRepo.addToBasket(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
    emit(true);
  }
}