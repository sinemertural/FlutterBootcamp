import 'package:calisma_yapisi/bottom_navigation_bar_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/bottom_navigation_bar_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/bottom_navigation_bar_kullanimi/sayfa_uc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarSayfa extends StatefulWidget {
  const BottomNavigationBarSayfa({super.key});

  @override
  State<BottomNavigationBarSayfa> createState() => _BottomNavigationBarSayfaState();
}

class _BottomNavigationBarSayfaState extends State<BottomNavigationBarSayfa> {
  int secilenSayfa = 0;
  var sayfalar = [SayfaBir(),SayfaIki(),SayfaUc()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation Bar") , backgroundColor: Colors.amber,),
      body: sayfalar[secilenSayfa],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.looks_one_rounded),label: "Bir"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_two_rounded), label: "İki"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_3_rounded), label: "Üç"),
      ],
          currentIndex: secilenSayfa,
        selectedItemColor: Colors.amber,
        onTap: (index){
        setState(() {
          secilenSayfa = index;
        });
        },
      )
    );
  }
}
