import 'package:flutter/material.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/widgets/action.dart';

class ResultadoPage extends StatelessWidget {
  final String text;
  const ResultadoPage({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    // _prefs.resultado = text;
    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      appBar: AppBar(
        title: Text("Orienta2"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[MyActions()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            resultCard(context, _prefs.resultado),
            Column(
              children: <Widget>[
                SizedBox(
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                    child: Text(
                      'VOLVER A INICIO',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget resultCard(context, text) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      height: 250.0,
      child: Card(
        color: Color.fromRGBO(69, 142, 190, 1),
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.white)),
          //  Text(text,
          //     style: TextStyle(fontSize: 35.0, color: Colors.white)),
        ),
      ),
    );
  }
}
