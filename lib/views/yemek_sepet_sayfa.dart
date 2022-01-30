import 'package:bitirme_projesi/cubit/yemek_detay_sayfa_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_sepet_sayfa_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/renkler.dart';
import 'package:bitirme_projesi/views/yemek_detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitirme_projesi/views/anasayfa.dart';

class YemekSepetSayfa extends StatefulWidget {

  @override
  _YemekSepetSayfaState createState() => _YemekSepetSayfaState();
}

class _YemekSepetSayfaState extends State<YemekSepetSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<YemekSepetSayfaCubit>().yemekleriSepeteYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("SEPETİM",style: TextStyle(color: yaziRenk2,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "MochiyPop"),),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => YemekleriListeleme()));
          }, icon: Icon(Icons.home_sharp )),
        ],
      ),
      body: BlocBuilder<YemekSepetSayfaCubit,List<YemeklerSepet>>(
        builder: (context,sepetYemeklerListesi){
          context.read<YemekSepetSayfaCubit>().yemekleriSepeteYukle();
          var tutar = 0;
          if(sepetYemeklerListesi.isNotEmpty){
            return ListView.builder(
                itemCount: sepetYemeklerListesi.length,
              itemBuilder: (context,indeks){
                  var yemek = sepetYemeklerListesi[indeks];
                  tutar = int.parse(yemek.yemek_fiyat) * int.parse(yemek.yemek_siparis_adet);
                  return SizedBox(height:100,
                    child: Card(
                      child: Row(
                        children: [
                          Text("${yemek.yemek_adi} - $tutar ₺ - Adet : ${yemek.yemek_siparis_adet}",style: TextStyle(color: koyuAnaRenk,fontWeight: FontWeight.bold,fontFamily: "Neon"),),
                          Spacer(),
                          Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                          IconButton(onPressed: (){
                            context.read<YemekSepetSayfaCubit>().yemekSil(int.parse(yemek.sepet_yemek_id));
                          },
                              icon: Icon(Icons.cancel)),
                        ],
                      ),
                    ),
                  );
              }
            );
          }else{
            return Center(
            );
          }
        }
      ),
    );
  }
}
