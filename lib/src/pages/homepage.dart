import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _estiloTxt = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientate'),
        centerTitle: true,
        backgroundColor: Color(0xFFB388FF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Ir a Test ',
                style: _estiloTxt,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/testfacil');
              },
            ),
            RaisedButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
