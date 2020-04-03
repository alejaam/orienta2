import 'package:flutter/material.dart';
import 'package:orientat/src/pages/cuestionariofacil.dart';

CuestionarioFacil tf = CuestionarioFacil();
bool ru = true;
int area1t = 0;
int area2t = 0;
int area3t = 0;
int area4t = 0;
int area5t = 0;

class TestFacil extends StatefulWidget {
  @override
  createState() => _TestFacilState();
}

class _TestFacilState extends State<TestFacil> {
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                tf.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Me Interesa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //tf.getAnswer();//Posiblemente este de adorno
                setState(() {
                  tf.respuestausuario = true;

                  //VALIDAR SI ES AREA1
                  tf.validararea1();
                  area1t = tf.area1;
                  print('$area1t');

                  //VALIDAR SI ES AREA 2
                  tf.validararea2();
                  area2t = tf.area2;
                  print('$area2t');

                  //VALIDAR SI ES AREA 3
                  tf.validararea3();
                  area3t = tf.area3;
                  print('$area3t');

                  //VALIDAR SI ES AREA 4
                  tf.validararea4();
                  area4t = tf.area4;
                  print('$area4t');

                  //VALIDAR AREA 5
                  tf.validararea5();
                  area5t = tf.area5;
                  print('$area5t');

                  tf.nextQuestion();
                  print('siguiente preg');
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'No me interesa ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // bool result =
                //     tf.getAnswer(); //posiblemnte este de adorno tambien
                setState(() {
                  tf.respuestausuario = false;
                  ru = false;
                  tf.nextQuestion();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
