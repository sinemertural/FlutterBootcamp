import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  @override
  Widget build(BuildContext context) {
    var tfKisiAdi = TextEditingController();
    var tfKisiTel = TextEditingController();

    Future <void> kaydet(String kisi_ad , String kisi_tel) async{
      print("Kişi Kaydet : $kisi_ad - $kisi_tel");
    }

    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Sayfa"),),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50 , right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi, decoration: InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfKisiTel, decoration: InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                kaydet(tfKisiAdi.text, tfKisiTel.text);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
