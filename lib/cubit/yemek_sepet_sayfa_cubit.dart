import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekSepetSayfaCubit extends Cubit<List<YemeklerSepet>> {
  YemekSepetSayfaCubit():super(<YemeklerSepet>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriSepeteYukle() async{
    var liste = await yrepo.sepetiYukle();
    emit(liste);
  }
  Future<void> yemekSil(int sepet_yemek_id) async{
    var liste = await yrepo.yemekleriSil(sepet_yemek_id);
    await yemekleriSepeteYukle();
  }
  Future<void> sepetYemekEkleme(
      String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,) async{
    await yrepo.sepeteYemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet);
  }

  }

