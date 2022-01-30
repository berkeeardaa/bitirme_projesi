import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler_cevap.dart';
import 'package:bitirme_projesi/entity/yemekler_cevap.dart';
import 'package:http/http.dart' as http;
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'dart:convert';

class YemeklerDaoRepository {
  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.fromJson(json.decode(cevap)).yemeklerListesi;
  }
  List<YemeklerSepet> parseSepetYemeklerCevap(String cevap){
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepetYemeklerListesi;
  }
  Future<List<Yemekler>> tumYemekleriAl() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap = await http.get(url);
    return parseYemeklerCevap(cevap.body);
  }
  Future<void> sepeteYemekEkle(
      String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi" : yemek_resim_adi,
      "yemek_fiyat" : yemek_fiyat.toString(),
      "yemek_siparis_adet" : yemek_siparis_adet.toString(),
      "kullanici_adi" : "BerkeArda"
    };
    var cevap = await http.post(url,body: veri);
    print(cevap.body);
  }
  Future<List<YemeklerSepet>> sepetiYukle() async{
    try {
      var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
      var veri = {
        "kullanici_adi" : "BerkeArda",
      };
      var cevap = await http.post(url,body: veri);
      return parseSepetYemeklerCevap(cevap.body);
    }catch(e){
      return <YemeklerSepet>[];
    }
  }
  Future<void> yemekleriSil(int sepet_yemek_id) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {
      "kullanici_adi" : "BerkeArda",
      "sepet_yemek_id":sepet_yemek_id.toString()
    };
    var cevap = await http.post(url,body: veri);
    print("sil : ${cevap.body}");
  }

}