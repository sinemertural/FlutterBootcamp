import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';
import 'package:bitirme_projesi_php_flutter/data/repo/productDao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeCubit extends Cubit<List<Product>>{

  HomeCubit() : super(<Product>[]);

  var pRepo = ProductDaoRepository();

  Future<void> getAllProducts() async{
    var list = await pRepo.loadProducts();
    emit(list);
  }
}