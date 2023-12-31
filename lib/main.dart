import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nasaimagen/config/theme/theme.dart';
import 'package:nasaimagen/providers/nasa_providers.dart';
import 'package:nasaimagen/screens/detalles.dart';
import 'package:nasaimagen/screens/login.dart';
import 'package:nasaimagen/screens/presentacion.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=>NasaProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nasa - Imagenes Favoritas',
        initialRoute: '/presentacion',
        routes: {
          '/presentacion': (context) => const PresentacionPage(),
          '/login':(context)=>const LoginScreen(),
          '/detalles':(context)=>const DetallesScreen(),
          //'/principal':(context)=>const PrinciplaScreen()
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
