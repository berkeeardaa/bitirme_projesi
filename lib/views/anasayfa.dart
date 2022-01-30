import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/renkler.dart';
import 'package:bitirme_projesi/views/yemek_detay_sayfa.dart';
import 'package:bitirme_projesi/views/yemek_sepet_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekleriListeleme extends StatefulWidget {
  @override
  _YemekleriListelemeState createState() => _YemekleriListelemeState();
}

class _YemekleriListelemeState extends State<YemekleriListeleme> {
  @override
  void initState() {
    super.initState();
    context.read<YemekleriListelemeCubit>().yemekleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
        Text("FLUTTEAT",style: TextStyle(fontFamily: "MochiyPop",color: yaziRenk2,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: anaRenk,
        centerTitle: true,
        leading: IconButton(tooltip: "Menu Icon",icon: Icon(Icons.dehaze),onPressed: (){ print("Menu Icon Tıklandı"); },
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)  => YemekSepetSayfa()));},
              icon: Icon(Icons.food_bank),
          ),
        ],
      ),
      body: BlocBuilder<YemekleriListelemeCubit,List<Yemekler>>(
                builder: (context,yemeklerListesi){
                  if(yemeklerListesi.isNotEmpty){
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: yemeklerListesi.length,
                      itemBuilder: (context,indeks){
                          var yemek = yemeklerListesi[indeks];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetaySayfa(yemek)));
                            },
                            child: SizedBox(height: 100,
                              child: Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${yemek.yemek_adi} - ${yemek.yemek_fiyat} ₺",style: TextStyle(color: koyuAnaRenk,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Neon"),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      }
                    );
                  }else{
                    return Center();
                  }
                },
              ),

          );



  }
}
