import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapplication/data/entity/yapilacaklar.dart';
import 'package:todoapplication/data/repo/yapilacaklardoa_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var krepo=YapilacaklarDaoRepository();

  Future<void> yapilacaklariYukle() async{
    var liste=await krepo.yapilacaklariYukle();
    emit(liste);
  }

  Future<void> ara(String aranacakKelime) async{
    var liste= await krepo.ara(aranacakKelime);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async{
    await krepo.sil(yapilacak_id);
    await yapilacaklariYukle();
  }



}