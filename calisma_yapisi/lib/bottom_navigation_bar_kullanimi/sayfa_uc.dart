import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SayfaUc extends StatefulWidget {
  const SayfaUc({super.key});

  @override
  State<SayfaUc> createState() => _SayfaUcState();
}

class _SayfaUcState extends State<SayfaUc> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("SAYFA ÜÇ" , style: TextStyle(fontSize: 25 , color: Colors.black),),
    );
  }
}
