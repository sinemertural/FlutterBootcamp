import 'package:bitirme_projesi_php_flutter/core/utils/string_extensions.dart';
import 'package:bitirme_projesi_php_flutter/data/entity/product.dart';
import 'package:bitirme_projesi_php_flutter/ui/view/basket_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitirme_projesi_php_flutter/ui/cubit/detail_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Product product;
  DetailPage(
     this.product,
  );

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _piece = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay sayfa"),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocListener<DetailCubit , bool>(
        listener : (context,state){
          if(state){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Sepete eklendi ✅"))
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.product.yemek_adi.toFileName()}.png"),
              Text("${widget.product.yemek_fiyat} ₺"),
              Text("${widget.product.yemek_adi}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    if(_piece > 1){
                      setState(() {
                        _piece--;
                      });
                    }
                  }, child: Icon(Icons.remove)),
                  Text("$_piece"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _piece++;
                    });
                  }, child: Icon(Icons.add))
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("110₺"),
                  ElevatedButton(
                      onPressed: (){
                        context.read<DetailCubit>().addToCart(
                            widget.product.yemek_adi,
                            widget.product.yemek_resim_adi,
                            widget.product.yemek_fiyat,
                            _piece,
                            "sinem");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BasketPage()));
                      },
                      child: Text("Sepete Ekle"
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
