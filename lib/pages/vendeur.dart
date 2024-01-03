import 'package:flutter/material.dart';



class Vendeur extends StatefulWidget {
  const Vendeur({super.key});

  @override
  State<Vendeur> createState() => _VendeurState();
}

class _VendeurState extends State<Vendeur> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: Center( child: Text("Hello carlos")),
    );
  }
}