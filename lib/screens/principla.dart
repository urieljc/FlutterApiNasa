import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nasaimagen/config/theme/color.dart';
import 'package:nasaimagen/providers/nasa_providers.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PrinciplaScreen extends StatelessWidget {
  User? user;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  PrinciplaScreen(
      {super.key, this.user, required this.auth, required this.googleSignIn});

  @override
  Widget build(BuildContext context) {
    //variables de control de la api provider
    final nasaProvider=Provider.of<NasaProvider>(context);
    final nasaList=nasaProvider.nasaImagen;
    //dimensiones de la pantalla
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    //metodo para cerrar la sesion de google

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('IMAGENES DE LA NASA')),
      ),
      body: nasaList==null?const Center(child: CircularProgressIndicator())
      :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Bienvenido ....',style: Theme.of(context).textTheme.bodyLarge,),
                  Text(user!.displayName ?? 'no tiene nombre'),
                  const Text('La imagen del dia'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: sizeW*0.8,
              height: sizeH*0.5,
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colores().bloque,
                        boxShadow: [
                          BoxShadow(
                              color: Colores().sombra,
                              blurRadius: 6,
                              offset: const Offset(4, 7))
                        ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    nasaList.imageUrl,
                    width: sizeW*0.7,
                    ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Spacer(),
                    Text(nasaList.date),
                    const Spacer(),
                    Text(nasaList.title),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: sizeH*0.07,
                  width: sizeW*0.5,
                  child: ElevatedButton(
                    onPressed: ()=>Navigator.pushNamed(context, '/detalles',
                    arguments: nasaList), 
                    child: const Text('Ver Mas..',style: TextStyle(fontSize: 30),)
                  ),
                )
              ],),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>nasaProvider.fetchApod(),
        child:const Icon(Icons.refresh)
        ),
      // Center(
      //   child: Column(
      //     children: [
      //       const Text("Gmil: "),
      //       Text(user!.email ?? 'no tiene email'),
      //       const Text('Nombre:'),
      //       Text(user!.displayName ?? 'no tiene nombre'),
      //       ElevatedButton(
      //           onPressed: () {
      //             cerrarSecion();
      //           },
      //           child: const Text('Cerrar secion'))
      //     ],
      //   ),
      // ),
      
      
    );
  }
}
