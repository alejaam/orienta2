import 'package:flutter/material.dart';

import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/widgets/action.dart';

class InstruccionesPage extends StatefulWidget {
  InstruccionesPage({Key key}) : super(key: key);
  @override
  _InstruccionesPageState createState() => _InstruccionesPageState();
}

class _InstruccionesPageState extends State<InstruccionesPage> {
  final _prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      appBar: AppBar(
        title: Text("Orienta2"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[MyActions()],
      ),
      body: PageView(
        controller:
            PageController(initialPage: 1, viewportFraction: 2, keepPage: true),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.red,
          ),
          Scaffold(
            body: Center(
              child: Container(
                height: 250,
                width: 250,
                color: Colors.indigoAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 20.0,
                      child: Text("HOLA"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
