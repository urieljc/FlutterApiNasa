import 'package:flutter/material.dart';
import 'package:nasaimagen/data/models/nasa_models.dart';

class DetallesScreen extends StatelessWidget {
  const DetallesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nasaModel argument=ModalRoute.of(context)!.settings.arguments as nasaModel;
    
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de la Imagen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(argument.title),
                const SizedBox(height: 20,),
                Text(argument.date),
                const SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: FadeInImage( 
                    placeholder: const AssetImage('assets/images/noImage.png'),
                    image: NetworkImage(argument.imageUrl)
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Descripcion: '),
                Text(argument.explanation)
              ],
            ),
          ),
        ),
      ),
    );
  }
}