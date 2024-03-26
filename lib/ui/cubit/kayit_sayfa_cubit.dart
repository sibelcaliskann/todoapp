import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapplication/data/repo/yapilacaklardoa_repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var krepo=YapilacaklarDaoRepository();

  Future<void> kaydet(String yapilacak_ad) async{
    await krepo.kaydet(yapilacak_ad);
  }
}