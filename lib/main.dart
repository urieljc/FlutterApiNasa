import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nasaimagen/config/theme/theme.dart';
import 'package:nasaimagen/screens/login.dart';
import 'package:nasaimagen/screens/presentacion.dart';
import 'package:nasaimagen/screens/principla.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nasa - Imagenes Favoritas',
      initialRoute: '/presentacion',
      routes: {
        '/presentacion': (context) => const PresentacionPage(),
        '/login':(context)=>const LoginScreen(),
        //'/principal':(context)=>const PrinciplaScreen()
      },
      theme: ThemeApp().theme(),
    );
  }
}
