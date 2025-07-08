import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  var alinanDeger = "";
  var resimAdi = "sad.png";
  bool switchDurum = false;
  bool chekboxDurum = false;
  var progressControl = false;
  double okunanDeger = 28.0;
  var tfTarih = TextEditingController();
  var tfSaat = TextEditingController();
  var ulkelerListesi = <String>[];
  var secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("Japonya");
    ulkelerListesi.add("Amerika");
  }

  var deger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Kullanimi" , style: TextStyle(color: Colors.white),) ,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanDeger),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(hintText: "Veriyi Giriniz"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanDeger = tfController.text;
                });
              }, child: Text("Veriyi Al")),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi = "happy.png";
                    });
                  }, child: Text("Mutlu")),
                  Image.asset("resimler/$resimAdi"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi = "sad.png";
                    });
                  }, child: Text("Üzgün"))
                ],
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox( width: 200,
                    child: SwitchListTile(
                        title: Text("Dart") ,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchDurum,
                        onChanged: (veri){
                      setState(() {
                        switchDurum = veri;
                      });
                    }),
                  ),
                  SizedBox( width: 200,
                    child: CheckboxListTile(
                        title: Text("Flutter") ,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: chekboxDurum,
                        onChanged: (veri){
                          setState(() {
                            chekboxDurum = veri!;
                          });
                        }),
                  ),
                ],
              ),
              ElevatedButton(onPressed: (){
                print("Chekbox Durum : $chekboxDurum");
                print("Switch Durum : $switchDurum");
                print("Radi Durum : $deger");
              }, child: Text("Göster")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox( width: 200,
                    child: RadioListTile(
                        title: Text("Barcelona") ,
                        value : 1,
                        groupValue: deger,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (veri){
                          setState(() {
                            deger = veri!;
                          });
                        }),
                  ),
                  SizedBox( width: 200,
                    child: RadioListTile(
                        title: Text("Real Madrid") ,
                        value: 2,
                        groupValue: deger,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (veri){
                          setState(() {
                            deger = veri!;
                          });
                        }),
                  ),
                ],
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressControl = true;
                    });
                  }, child: Text("BAŞLA")),
                  Visibility(
                    visible : progressControl ,
                    child: CircularProgressIndicator(),),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressControl = false;
                    });
                  }, child: Text("BİTİR"))
                ],
              ),
              
              Text(okunanDeger.toInt().toString()),
              Slider(max : 100.0 , min :0.0, value: okunanDeger, onChanged: (veri){
                setState(() {
                  okunanDeger = veri;
                });
              }),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width:120 ,
                      child:
                      TextField(controller: tfSaat,decoration: const InputDecoration(hintText: "Saat") ,)),
        
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value){
                      tfSaat.text = "${value!.hour} : ${value.minute}";
                    });
                  }, icon: Icon(Icons.timer)),
                  
                  SizedBox(width:120 ,
                      child:
                      TextField(controller: tfTarih ,decoration: const InputDecoration(hintText: "Tarih"),)),
        
                  IconButton(onPressed: (){
                    showDatePicker(
                    context: context,
                    firstDate:DateTime(2000),lastDate: DateTime(2050) ,initialDate: DateTime.now()).then((value){
                      tfTarih.text = "${value!.day} - ${value.month} - ${value.year}";
                    });
                  }, icon: Icon(Icons.date_range)),
                ],
              ),
              
              DropdownButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: secilenUlke,
                  items: ulkelerListesi.map((ulke){
                    return DropdownMenuItem(value: ulke,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }),
        
              GestureDetector(
                child: Container(height: 500, width: 200, color: Colors.red,),
                onTap: (){
                    print("Bir kere tıklandı.");
              },
                onDoubleTap: (){
                  print("İki kere tıklandı");
              },
                onLongPress: (){
                  print("Uzun tıklandı");
              },)
            ],
          ),
        ),
      ),
    );
  }
}
