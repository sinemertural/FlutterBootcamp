import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi)async{
    print("Kişi Ara : $aramaKelimesi");
  }

  Future<void> sil(int kisi_id)async{
    print("Kişi Sil : $kisi_id");
  }

  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_adi: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 1, kisi_adi: "Mehmet", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 1, kisi_adi: "Zeynep", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);

    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
        onChanged: (aramaSonucu){
            ara(aramaSonucu);
        },) :
        Text("Kişiler"),
      actions: [
        aramaYapiliyorMu ?
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
        }, icon: Icon(Icons.close))
            :
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });
        }, icon: Icon(Icons.search))
      ],),
      body:
          FutureBuilder<List<Kisiler>> (
              future: kisileriYukle(),
              builder: (context,snapshot){
                if(snapshot.data != null){
                  var kisilerListesi = snapshot.data;
                  return ListView.builder(
                    itemCount: kisilerListesi?.length,
                    itemBuilder: (context,index){
                      var kisi = kisilerListesi?[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
                              .then((value){
                                print("Anasayfaya Dönüldü");
                          });
                        },
                        child: Card(
                          child: SizedBox(height: 100,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(kisi!.kisi_adi , style: TextStyle(fontSize: 20),),
                                    Text(kisi.kisi_tel)
                                  ],
                                ),
                                Spacer(),
                                IconButton(onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("${kisi.kisi_adi} silinsin mi ?"),
                                    action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: (){
                                          sil(kisi.kisi_id);
                                          },
                                    )
                                    )
                                  );
                                }, icon: Icon(Icons.close))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  
                }else{
                  return const Center();
                }
              }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const KayitSayfa())).then((value){
              print("Anasayfaya dönüldü");
            }) ;
          },
          child: Icon(Icons.add),),
    );
  }
}
