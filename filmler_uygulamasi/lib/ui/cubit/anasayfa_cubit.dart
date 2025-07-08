import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:filmler_uygulamasi/data/repo/filmlerDao_repostory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>>{

  AnasayfaCubit() : super(<Filmler>[]);

  var frepo = FilmlerDaoRepostory();

  Future<void> filmleriYukle() async{
    var liste = await frepo.filmleriYukle();
    emit(liste);
  }
}