import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _SuperioresProvider {
  List<dynamic> superiores = []; //Inicializamos una lista vacia

  _SuperioresProvider() {
    cargarData('superiores.json');
  }

  Future<List<dynamic>> cargarData(file) async {
    final response = await rootBundle.loadString('data/$file');

    Map dataMap = json.decode(response);
    superiores = dataMap['superiores'];

    return superiores;
  }
}

final superioresProvider = new _SuperioresProvider();
