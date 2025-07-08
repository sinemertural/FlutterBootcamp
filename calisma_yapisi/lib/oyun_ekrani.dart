import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget{
  Kisiler kisi ;
  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Oyun Ekranı"), backgroundColor: Colors.blue,
      leading: IconButton(onPressed: (){
        print("geri tuşuna basıldı");
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new)),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.kisi.isim} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekarMi}"),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
            }, child: Text("Bitti"))
          ],
        ),
      ),
    );
  }
}
