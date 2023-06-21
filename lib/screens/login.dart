import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nasaimagen/config/theme/color.dart';
import 'package:nasaimagen/screens/principla.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //dimensiones de la pantalla
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    //controladores de ingreso de texto
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    //autentificacion de google
    final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
    final GoogleSignIn _googleSingIn=GoogleSignIn();
    User? user;
    //estado del formulario
    final formKey=GlobalKey<FormState>();
    //funcion de login por google
    Future loginGoogle() async{
      final GoogleSignInAccount? googleSignInAccount=await _googleSingIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount!.authentication;
      final AuthCredential authCredential=GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      try {
        final UserCredential userCredential=await _firebaseAuth.signInWithCredential(authCredential);
        return userCredential;
      } catch (e) {
        return null;
      }
    }
    //inicio de la app
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/fondo2.png"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: sizeH * 0.09,
              ),
              Container(
                height: sizeH * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/nasa.png')),
                ),
              ),
              SizedBox(
                height: sizeH * 0.04,
              ),
              Center(
                child: Container(
                  height: sizeH * 0.47,
                  width: sizeW * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colores().bloque,
                      boxShadow: [
                        BoxShadow(
                            color: Colores().sombra,
                            blurRadius: 6,
                            offset: const Offset(4, 7))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Ingreso",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: TextFormField(
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                    hintText: 'Correo',
                                    labelText: 'Correo Electronico',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    icon: const Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    iconColor: Colores().letras,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: Colores().sombra),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 15),
                              child: TextFormField(
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    labelText: 'Contraseña',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    icon: const Icon(
                                      Icons.password,
                                      size: 50,
                                    ),
                                    iconColor: Colores().letras,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: Colores().sombra),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  NeumorphicButton(
                                    width: sizeW * 0.3,
                                    height: sizeH * 0.08,
                                    topLeftShadowColor: Colors.white70,
                                    backgroundColor: Colores().botones,
                                    bottomRightShadowColor: Colores().sombra,
                                    borderRadius: 20,
                                    bottomRightShadowBlurRadius: 15,
                                    onTap: () {},
                                    child: const Center(child: Text("Ingreso")),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  NeumorphicButton(
                                    width: sizeW * 0.3,
                                    height: sizeH * 0.08,
                                    topLeftShadowColor: Colors.white70,
                                    backgroundColor: Colores().botones,
                                    bottomRightShadowColor: Colores().sombra,
                                    borderRadius: 20,
                                    bottomRightShadowBlurRadius: 15,
                                    onTap: () {},
                                    child: const Center(child: Text("Salir")),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: sizeH * 0.07,
                  width: sizeW * 0.8,
                  decoration: BoxDecoration(
                      color: Colores().bloque,
                      borderRadius: BorderRadius.circular(45),
                      boxShadow: [
                        BoxShadow(
                            color: Colores().sombra,
                            blurRadius: 6,
                            offset: const Offset(4, 7))
                      ]),
                  child: ElevatedButton(
                    onPressed: ()async{
                      UserCredential? userCredentialFinal=await loginGoogle();
                      if (userCredentialFinal!=null) {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder:(context)=>PrinciplaScreen())
                        );
                      }
                    }, 
                    child:Row(children: [
                      Image.asset('assets/images/google.png',width: 40,),
                      const Spacer(),
                      const Text("Inicio de Secion con Google",style: TextStyle(fontSize: 16),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios),
                      const Icon(Icons.arrow_forward_ios),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
