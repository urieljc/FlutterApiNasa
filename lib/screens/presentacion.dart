import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasaimagen/config/theme/color.dart';

class PresentacionPage extends StatelessWidget {
  const PresentacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH=MediaQuery.of(context).size.height;
    final sizeW=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "NASA - IMAGENES",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Divider(
            height: 30,
            color: Colores().fondo,
          ),
          SizedBox(
            height: sizeH*0.4,
            width: sizeW*0.9,
            child: Lottie.asset('assets/images/nasaLogo.json'),
          ),
          Divider(
            height: 30,
            color: Colores().fondo,
          ),
          const Text("Cargando......")
        ],
      ),
    );
  }
}
