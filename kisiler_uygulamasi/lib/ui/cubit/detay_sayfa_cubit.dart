import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repostory.dart';

class DetaySayfaCubit extends Cubit<void>{

  DetaySayfaCubit() : super(0);
  var krepo = KisilerDaoRepostory();

  Future<void> guncelle (int kisi_id , String kisi_adi , String kisi_tel) async {
    await krepo.guncelle(kisi_id, kisi_adi, kisi_tel);
  }


}