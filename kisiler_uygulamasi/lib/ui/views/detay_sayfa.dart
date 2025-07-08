import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  DetaySayfa({required this.kisi});



  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> guncelle (int kisi_id , String kisi_adi , String kisi_tel) async {
    print("Kişi Guncelle : $kisi_id - $kisi_adi - $kisi_tel");
  }

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_adi;
    tfKisiTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Detay"),),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50 , left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi, decoration: InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfKisiTel, decoration: InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                guncelle(widget.kisi.kisi_id, widget.kisi.kisi_adi, widget.kisi.kisi_tel);
              }, child: Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
