import 'package:block_pattern_kullanimi/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfSayiBir = TextEditingController();
  var tfSayiIki= TextEditingController();
  int sonuc = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Kullanimi" ,style: TextStyle(color: Colors.white ),),
          backgroundColor: Colors.blueAccent,),
      body: Center(
        child:
        Padding(
          padding: const EdgeInsets.only(right: 50 , left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(
                  builder: (context , sonuc){
                    return Text("$sonuc" , style: TextStyle(fontSize: 35),);
                  }),
              TextField(
                controller: tfSayiBir,
              decoration: InputDecoration(hintText: "Sayı 1")),
              TextField(
                controller: tfSayiIki,
                decoration: InputDecoration(hintText: "Sayı 2"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    String alinanSayiBir = tfSayiBir.text;
                    String alinanSayiIki = tfSayiIki.text;
                    context.read<AnasayfaCubit>().toplamaYap(tfSayiBir.text, tfSayiIki.text);
                  }, child: Text("TOPLAMA")),
                  ElevatedButton(onPressed: (){
                    String alinanSayiBir = tfSayiBir.text;
                    String alinanSayiIki = tfSayiIki.text;
                    context.read<AnasayfaCubit>().carpmaYap(tfSayiBir.text, tfSayiIki.text);
                  }, child: Text("CARPMA"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
