import 'package:flutter/material.dart';
import 'package:orientat/src/pages/cuestionariofacil.dart';
import 'package:orientat/src/pages/testfacil.dart';

class ResultadoPage extends StatelessWidget {
  final String text;
  const ResultadoPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Inicio")),
          BottomNavigationBarItem(
              icon: Icon(Icons.explicit), title: Text("Other")),
        ],
      ),
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
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Center(child: Text("ale_jaam")),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(child: cards(context)),
      ),
    );
  }

  Widget cards(context) {
    return GestureDetector(
      onTap: () {
        print("Hola");
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Color.fromRGBO(69, 142, 190, 1),
            elevation: 10.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: new Text(text,
                            style: new TextStyle(
                                fontSize: 35.0, color: Colors.white)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
