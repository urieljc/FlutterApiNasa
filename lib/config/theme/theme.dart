import 'package:flutter/material.dart';
import 'package:nasaimagen/config/theme/color.dart';

class ThemeApp{
    ThemeData theme()=>ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colores().bloque,
    scaffoldBackgroundColor: Colores().fondo,

    fontFamily: 'Satisfy',
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colores().letras),
      bodyLarge: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colores().letras),

    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colores().apbar,
    ),
  );
}