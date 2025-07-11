import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/cubit/kayit_sayfa_cubit.dart';

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
                context.read<KayitSayfaCubit>().kaydet(tfKisiAdi.text, tfKisiTel.text);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
