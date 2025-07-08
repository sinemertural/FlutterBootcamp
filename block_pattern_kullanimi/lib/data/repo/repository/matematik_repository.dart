class MatematikRepository{

  int toplamaYap (var alinanSayiBir , var alinanSayiIki){
    int sayi1 = int.parse(alinanSayiBir);
    int sayi2 = int.parse(alinanSayiIki);
    int toplam = sayi2 + sayi1;
    return toplam;
  }

  int carpmaYap(var alinanSayiBir , var alinanSayiIki){
    int sayi1 = int.parse(alinanSayiBir);
    int sayi2 = int.parse(alinanSayiIki);
    int carpim = sayi2 * sayi1;
   return carpim;
  }
}