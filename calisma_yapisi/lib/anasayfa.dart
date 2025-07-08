import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("sayfa açıldı");
  }
  @override
  Widget build(BuildContext context) {
    print("sayfa açıldı");
    return Scaffold(
      appBar: AppBar(title: Text("Anasayfa"), backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac" , style: TextStyle(fontSize: 22),),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac = sayac + 1;
              });
            }, child: Text("Tıkla")),
            ElevatedButton(onPressed: (){
                Kisiler kisi = Kisiler(isim : "Sinem", yas : 20, boy : 1.52, bekarMi : false);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    OyunEkrani(kisi: kisi))).then((value){
                  print("anasayfaya dönüldü");
                });
            }, child: Text("Başla"))
          ],
        ),
      ),
    );
  }
}
