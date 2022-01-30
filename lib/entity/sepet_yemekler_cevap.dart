import 'package:bitirme_projesi/entity/sepet_yemekler.dart';

class SepetYemeklerCevap {
  List<YemeklerSepet> sepetYemeklerListesi;
  int success;

  SepetYemeklerCevap({required this.sepetYemeklerListesi,required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<YemeklerSepet> sepetYemeklerListesi = jsonArray.map((jsonArrayNesnesi) => YemeklerSepet.fromJson(jsonArrayNesnesi)).toList();
    return SepetYemeklerCevap(sepetYemeklerListesi: sepetYemeklerListesi, success: json["success"] as int);
  }
}