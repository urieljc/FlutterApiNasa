import 'package:flutter/material.dart';
import 'package:nasaimagen/config/theme/theme.dart';
import 'package:nasaimagen/screens/presentacion.dart';


void main() => runApp(const MyApp());

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
      },
      theme: ThemeApp().theme(),
    );
  }
}
