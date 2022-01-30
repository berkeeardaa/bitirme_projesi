import 'package:bitirme_projesi/cubit/yemek_detay_sayfa_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_sepet_sayfa_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/renkler.dart';
import 'package:bitirme_projesi/views/yemek_sepet_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;


  YemekDetaySayfa(this.yemek);

  @override
  _YemekDetaySayfaState createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {

  var tfadet = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.yemek.yemek_adi}",style: TextStyle(color: yaziRenk2,fontFamily: "MochiyPop"),),),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
                      Text("${widget.yemek.yemek_fiyat} ₺",style: TextStyle(color: anaRenk,fontSize: 40,fontFamily: "Neon"),),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(controller: tfadet,),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        context.read<YemekSepetSayfaCubit>().sepetYemekEkleme(
                            widget.yemek.yemek_adi,
                            widget.yemek.yemek_resim_adi,
                            int.parse(widget.yemek.yemek_fiyat),
                            int.parse(tfadet.text),
                           );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => YemekSepetSayfa()));

                      },
                      child: Text("Sepete Ekle",style: TextStyle(color: yaziRenk1,fontFamily: "Neon"),),
                    ),

                  ],
                ),
      ),);
            }

        }

