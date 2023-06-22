import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nasaimagen/data/models/nasa_models.dart';

class NasaProvider with ChangeNotifier {
  nasaModel? _nasaImagen;

  nasaModel? get nasaImagen => _nasaImagen;

  Future<void> fetchApod() async {
    const apiKey = '8Dgfj0OTvjbfA5d7mete8sJpdfLjkZeZeFiKZdyf';

    final response = await http
        .get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = await json.decode(response.body);
      _nasaImagen = nasaModel.fromJson(jsonData);
    }

    notifyListeners();
  }
}
