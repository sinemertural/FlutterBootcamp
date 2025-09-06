import 'package:bitirme_projesi_php_flutter/data/entity/basket_product.dart';
import 'package:bitirme_projesi_php_flutter/ui/cubit/basket_cubit.dart';
import 'package:bitirme_projesi_php_flutter/ui/widget/basket_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BasketCubit>().getBasketProducts("sinem");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: BlocBuilder<BasketCubit,List<BasketProduct>>(
          builder: (context , basketProducts){
            if(basketProducts.isNotEmpty){
              return ListView.builder(
                itemCount: basketProducts.length,
                itemBuilder: (context, index){
                  var product = basketProducts[index];
                  return BasketCard(product);
                },
              );
          }return Center();
        }
      ),
    );
  }
}
