import 'package:bitirme_projesi_php_flutter/core/theme/app_colors.dart';
import 'package:bitirme_projesi_php_flutter/ui/cubit/home_cubit.dart';
import 'package:bitirme_projesi_php_flutter/ui/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<HomeCubit,List<Product>>(
        builder: (context , productLists){
          if(productLists.isNotEmpty){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.8
                ),
                itemCount: productLists.length,
                itemBuilder: (context, index){
                  var products = productLists[index];
                  return ProductCard(product : products);
                });
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
