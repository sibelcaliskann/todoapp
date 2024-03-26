import 'package:todoapplication/data/entity/yapilacaklar.dart';
import 'package:todoapplication/data/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository{

  Future<void> kaydet(String yapilacak_ad) async{
    var db= await VeritabaniYardimcisi.veritabaniErisim();
    var yeniGorev= Map<String,dynamic>();

    yeniGorev["yapilacak_adi"]= yapilacak_ad;
    await db.insert("toDos", yeniGorev);
  }

  Future<void> guncelle(int yapilacak_id,String yapilacak_ad) async{
    var db= await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenecekGorev=Map<String,dynamic>();

    guncellenecekGorev["yapilacak_adi"]=yapilacak_ad;
    await db.update("toDos", guncellenecekGorev,where:"yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<void> sil(int yapilacak_id) async{
    var db= await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("toDos",where:"yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<List<Yapilacaklar>> yapilacaklariYukle() async{
    var db= await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (i){
      var satir=maps[i];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_adi: satir["yapilacak_adi"]);
    });
  }

  Future<List<Yapilacaklar>> ara(String arancakKelime) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps= await db.rawQuery("SELECT * FROM toDos WHERE yapilacak_adi like '%$arancakKelime%'");

    return List.generate(maps.length, (i){
      var satir=maps[i];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_adi: satir["yapilacak_adi"]);
    });
  }


}