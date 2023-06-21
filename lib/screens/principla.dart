import 'package:flutter/material.dart';

class PrinciplaScreen extends StatelessWidget {
  

  const PrinciplaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child:Text('IMAGENES DE LA NASA')),),
      body:const Center(child: Text("pagina principal")),
    );
  }
}