void main () {
  //Sayısaldan sayısala donuşum
  int i = 5;
  double d = 56.6;

  var sonuc1 = i.toDouble();
  var sonuc2 = d.toInt();

  print(sonuc1);
  print(sonuc2);

  //sayısaldan metine dönüşüm

  var sonuc3 = i.toString(); // "5"
  var sonuc4 = d.toString(); // "56.6"

  print(sonuc3);
  print(sonuc4);

  //metinden sayısala dönüşüm

  var sonuc5 = int.parse(sonuc3);
  var sonuc6 = double.parse(sonuc4);

  print(sonuc5);
  print(sonuc6);

}