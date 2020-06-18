import 'package:flutter/material.dart';
import 'package:orientat/src/models/cuestionariofacil.dart';

CuestionarioFacil tf = CuestionarioFacil();

class TestFacil extends StatefulWidget {
  @override
  createState() => _TestFacilState();
}

class _TestFacilState extends State<TestFacil> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(187, 225, 250, 1),
        appBar: AppBar(
          title: Text("Orienta-T"),
          backgroundColor: Color.fromRGBO(38, 93, 130, 1),
          actions: <Widget>[
            Container(
              child: Icon(Icons.notifications_none),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              // child:
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Center(child: Text("ale_jaam")),
            ),
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                // height: _screenSize.height / 2,
                width: _screenSize.height / 2,
                child: Card(
                  color: Color.fromRGBO(69, 142, 190, 1),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          tf.getQuestionText(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)),
                    ),
                    child: IconButton(
                      iconSize: 90,
                      icon: Icon(Icons.mood_bad),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          tf.respuestausuario = false;
                          // tf.validararea();
                          tf.nextQuestion(context);
                          print('siguiente pregunta');
                        });
                      },
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)),
                    ),
                    child: IconButton(
                      iconSize: 90,
                      icon: Icon(Icons.mood),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          tf.respuestausuario = true;
                          tf.validararea();
                          tf.nextQuestion(context);
                          print('siguiente pregunta');
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
