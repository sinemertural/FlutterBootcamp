import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    test();
  }

  Future<void> test() async{
    var sp = await SharedPreferences.getInstance();
    //veri kaydı
    sp.setString("ad", "Ahmet");
    //veri silme
    sp.remove("ad");
    // veri okuma
    String gelen = sp.getString("ad") ?? "isim yok";
    print("Gelen ad : $gelen ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Açılış Sayısı : " , style: TextStyle(
              fontSize: 25
            ),)
          ],
        ),
      ),
    );
  }
}
