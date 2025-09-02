import 'package:bitirme_projesi_php_flutter/core/utils/string_extensions.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key , required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.product.yemek_adi.toFileName()}.png"),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.favorite_outline)
                )
              ],
            ),
            Text("${widget.product.yemek_adi}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Ücretsiz Gönderim"),
            Spacer(),
            Row(
              children: [
                Text("${widget.product.yemek_fiyat} ₺" ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                Spacer(),
                ElevatedButton(
                    onPressed: (){
                  //sepete eklenecek
                },
                    child: Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
