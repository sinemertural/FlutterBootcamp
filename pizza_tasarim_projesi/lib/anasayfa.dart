import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_tasarim_projesi/color.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    
    //çoklu ekran desteği 
    var ekranBilgisi = MediaQuery.of(context);
    var ekranYukseklik = ekranBilgisi.size.height;
    var ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran Yükseklik : $ekranYukseklik");
    print("Ekran Genislik : $ekranGenisligi");
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza" , style: TextStyle(color: yaziRenk1 , fontFamily: "Pacifico" , fontSize: 22),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: ekranGenisligi/43),
              child: Text("Beef Cheese" , style: TextStyle(fontSize: 36 , color: anaRenk , fontWeight: FontWeight.bold ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset("resimler/pizza_resim.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(icerik: "Cheese"),
                  Chip(icerik: "Sausage"),
                  Chip(icerik: "Olive"),
                  Chip(icerik: "Pepper"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("20 min" , style: TextStyle(fontWeight: FontWeight.bold , color: yaziRenk2 , fontSize: 22),),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Delivery" , style: TextStyle(color: anaRenk , fontSize: 22 , fontWeight: FontWeight.bold),),
                  ),
                  Text("Meat lover , get ready to meet your pizza ! " , style: TextStyle(color: yaziRenk2 , fontSize: 22) ,
                      textAlign: TextAlign.center,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("\$ 5.98", style: TextStyle(fontSize: 45 , color: anaRenk , fontWeight: FontWeight.bold),),
                SizedBox(width: 200, height: 50,
                  child: TextButton(onPressed: (){},
                      child: Text("ADD TO CART" , style: TextStyle(color: yaziRenk1 , fontSize: 22),),
                  style: TextButton.styleFrom(
                    backgroundColor: anaRenk,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),),
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}

class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      child: Text(icerik , style: TextStyle(color: yaziRenk1),),
      style: TextButton.styleFrom(backgroundColor: anaRenk),);
  }
}
