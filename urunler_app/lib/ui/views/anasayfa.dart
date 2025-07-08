import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urunler_app/ui/views/detay_sayfa.dart';

import '../../data/entity/urunler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

Future<List<Urunler>> urunlerYukle() async{
  var urunListesi = <Urunler>[];
  var u1 = Urunler(id: 1, adi: "Mackbook Pro 14", resim: "bilgisayar.png", fiyat: 43000);
  var u2 = Urunler(id: 2, adi: "Rayban Club Master", resim: "gozluk.png", fiyat: 2500);
  var u3 = Urunler(id: 3, adi: "Sony ZX Series", resim: "kulaklik.png", fiyat: 40000);
  var u4 = Urunler(id: 4, adi: "Gio Armani", resim: "parfum.png", fiyat: 2000);
  var u5 = Urunler(id: 5, adi: "Casio X Series", resim: "saat.png", fiyat: 8000);
  var u6 = Urunler(id: 6, adi: "Dyson V8", resim: "supurge.png", fiyat: 18000);
  var u7 = Urunler(id: 7, adi: "Iphone 13", resim: "telefon.png", fiyat: 32000);

  urunListesi.add(u1);
  urunListesi.add(u2);
  urunListesi.add(u3);
  urunListesi.add(u4);
  urunListesi.add(u5);
  urunListesi.add(u6);
  urunListesi.add(u7);

  return urunListesi;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Urunler"),),
      body:
        FutureBuilder<List<Urunler>> (
            future: urunlerYukle(),
            builder: (context, snapshot){
              if(snapshot.data != null){
                var urunlerListesi = snapshot.data;
                return ListView.builder(
                  itemCount: urunlerListesi?.length,
                  itemBuilder: (context,index){
                    var urun = urunlerListesi?[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(urun))).then((value){
                          print("Anasayfaya dönüldü");
                        });
                      },
                      child: SizedBox( height: 150,
                        child: Card(
                          child:
                          Row(
                            children: [
                              Image.asset("resimler/${urun!.resim}"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(urun!.adi),
                                    Text("${urun.fiyat.toString()} ₺" , style: TextStyle(fontSize: 20),),
                                    ElevatedButton(onPressed: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("${urun.adi} sepete eklendi"),
                                            duration: Duration(seconds: 2),
                                          ));
                                    }, child: Text("SEPETE EKLE")),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },);
              }else{
                return Center();
              }
            })
    );
  }
}
