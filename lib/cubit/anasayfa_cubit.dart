import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekleriListelemeCubit extends Cubit<List<Yemekler>>{

  YemekleriListelemeCubit():super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async{
    var liste = await yrepo.tumYemekleriAl();
    emit(liste);
  }

}