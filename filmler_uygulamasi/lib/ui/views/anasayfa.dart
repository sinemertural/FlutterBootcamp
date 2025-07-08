import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:filmler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget{
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<AnasayfaCubit>().filmleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler"),),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        builder: (context, filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.8
                ),
                itemCount: filmlerListesi.length,
                itemBuilder: (context,indeks){
                  var filmler = filmlerListesi?[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(filmler!))).then((value){
                        print("Anasayfaya dönüldü");
                      });
                    },
                    child: Card(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("resimler/${filmler?.resim}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${filmler?.fiyat.toString()} ₺", style: TextStyle(fontSize: 20),),
                              ElevatedButton(onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${filmler?.ad} sepete eklendi."),
                                      duration: Duration(seconds: 2),));
                              }, child: Text("Sepete Ekle")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
