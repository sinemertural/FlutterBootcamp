import 'package:bitirme_projesi_php_flutter/core/utils/string_extensions.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Product product;
  DetailPage(this.product);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay sayfa"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.product.yemek_adi.toFileName()}.png"),
            Text("${widget.product.yemek_fiyat} ₺"),
            Text("${widget.product.yemek_adi}"),
          ],
        ),
      ),
    );
  }
}
