import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  @override
  Widget build(BuildContext context) {
   var tfController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Kullanici Etkilesimi"), backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:
                  Text("Silmek istediğinize emin misiniz ?"),
                  action: SnackBarAction(label: "Evet", onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: 
                        Text("Silindi")
                        ));
                  }),
                  ));
            }, child: Text("Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:
                  Text("Silmek istediğinize emin misiniz ?"),
                    action: SnackBarAction(label: "Evet", onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:
                          Text("Silindi",style: TextStyle(color: Colors.red),)
                          ));
                    }),
                  ));
            }, child: Text("Özelleştirilmiş Snackbar")),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Başlık"),
                  content: Text("İçerik"),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Text("İptal")),
                    TextButton(onPressed: (){},
                        child: Text("Tamam")),

                  ],
                );
              });
            }, child: Text("Alert")),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text("KAYIT İŞLEMİ"),
                  content: TextField(
                    controller: tfController,
                    decoration: const InputDecoration(hintText: "Veri"),),
                  actions: [
                    TextButton(onPressed: (){
                      print("okunan değer : ${tfController.text}");
                    }, child: Text("KAYDET"))
                  ],
                );
              });
            }, child: Text("Özelleştirilmiş Alert")),
          ],
        ),
      ),
    );
  }
}
