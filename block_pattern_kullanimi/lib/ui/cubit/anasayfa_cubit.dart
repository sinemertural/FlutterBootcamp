import 'package:block_pattern_kullanimi/data/repo/repository/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>{
  AnasayfaCubit() : super(0);
  
  var mrepo = MatematikRepository();
  
  void toplamaYap (var alinanSayiBir , var alinanSayiIki){
    emit(mrepo.toplamaYap(alinanSayiBir, alinanSayiIki));
  }

  void carpmaYap(var alinanSayiBir , var alinanSayiIki){
    emit(mrepo.carpmaYap(alinanSayiBir, alinanSayiIki));
  }
  
  
}