import 'package:bitirme_projesi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetaySayfaCubit extends Cubit<void> {
  YemekDetaySayfaCubit():super(0);

  var yrepo = YemeklerDaoRepository();

  Future<void> sepetYemekEkleme(
      String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,) async{
    await yrepo.sepeteYemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet);
  }
}