import 'package:dart_dersleri/nesneye_yonelik_programlama%20/Araba.dart';

void main(){
  var a1 = Araba("kirmizi", true, 30);

  print("Arabam ${a1.renk} renk ve arabam çalışıyor mu ? ${a1.calisiyorMu} ve hizim ${a1.hiz}");
}