import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/entity/urunler.dart';

class DetaySayfa extends StatefulWidget {
  Urunler urun ;
  DetaySayfa(this.urun);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  void initState() {
    super.initState();
    var urun = widget.urun;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.urun.adi),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "resimler/${widget.urun.resim}",),
            Text("${widget.urun.fiyat.toString()} ₺" , style: TextStyle(fontSize: 35),)
          ],
        ),
      ),

    );
  }
}
