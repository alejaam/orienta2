import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = []; //Inicializamos una lista vacia

  _MenuProvider() {
    //Constructor
    // cargarData();
  }

  Future<List<dynamic>> cargarData(file) async {
    final response = await rootBundle.loadString('data/$file');
    Map dataMap = json.decode(response);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
