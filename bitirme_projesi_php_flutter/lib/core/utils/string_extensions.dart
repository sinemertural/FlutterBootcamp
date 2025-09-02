extension StringExtensions on String {
  String toFileName() {
    return this
        .toLowerCase()
        .replaceAll("ı", "i")
        .replaceAll("İ", "i")
        .replaceAll("ş", "s")
        .replaceAll("Ş", "s")
        .replaceAll("ğ", "g")
        .replaceAll("Ğ", "g")
        .replaceAll("ç", "c")
        .replaceAll("Ç", "c")
        .replaceAll("ö", "o")
        .replaceAll("Ö", "o")
        .replaceAll("ü", "u")
        .replaceAll("Ü", "u")
        .replaceAll(" ", "");
  }
}
