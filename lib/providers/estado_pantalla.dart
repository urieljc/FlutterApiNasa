import 'package:flutter/foundation.dart';

class EstadoPantallaProvider with ChangeNotifier{
  bool _mostrarBienvenidaScrenn=true;
  bool get mostrarPantallaScreen=>_mostrarBienvenidaScrenn;

  void ocultarPantallaScreen(){
    _mostrarBienvenidaScrenn=false;
    notifyListeners();
  }
}