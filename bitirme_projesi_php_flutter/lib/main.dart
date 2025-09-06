import 'package:bitirme_projesi_php_flutter/ui/cubit/basket_cubit.dart';
import 'package:bitirme_projesi_php_flutter/ui/cubit/detail_cubit.dart';
import 'package:bitirme_projesi_php_flutter/ui/cubit/home_cubit.dart';
import 'package:bitirme_projesi_php_flutter/ui/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => DetailCubit()),
        BlocProvider(create: (context) => BasketCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Home(),
      ),
    );
  }
}
