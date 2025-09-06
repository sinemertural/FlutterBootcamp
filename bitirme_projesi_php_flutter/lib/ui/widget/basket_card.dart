import 'package:flutter/material.dart';
import 'package:bitirme_projesi_php_flutter/core/utils/string_extensions.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/basket_product.dart';

class BasketCard extends StatelessWidget {
  final BasketProduct basketProduct;

  const BasketCard(this.basketProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              "http://kasimadalan.pe.hu/yemekler/resimler/${basketProduct.yemek_adi.toFileName()}.png",
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(basketProduct.yemek_adi,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("${basketProduct.yemek_fiyat} ₺"),
                  Text("Adet: ${basketProduct.yemek_siparis_adet}"),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: (){

                  },
                ),
                Text(
                  "${basketProduct.yemek_fiyat * basketProduct.yemek_siparis_adet} ₺",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
