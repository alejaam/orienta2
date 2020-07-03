import 'package:flutter/material.dart';
import 'package:orientat/src/pages/plantel_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class PlanetelesPage extends StatelessWidget {
  // const PlanetelesPage({Key key}) : super(key: key);
  final List<dynamic> escuelas;
  PlanetelesPage({Key key, @required this.escuelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Universidad universidad = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      // bottomNavigationBar: _bottomNavigationBar(context),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Orienta2"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[MyActions()],
      ),
      body: ListView(
          padding: EdgeInsets.all(20),
          children: _cardsPlantel(context, escuelas)),
    );
  }

  List<Widget> _cardsPlantel(context, List<dynamic> escuelas) {
    final List<Widget> cards = [];
    for (var institucion in escuelas) {
      final widgTemp = GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanetelPage(
                plantel: institucion["carreras"],
                ubicacion: institucion["ubicacion"],
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, //Difuminado
                    spreadRadius: 2.0, // Que tanto queremos que se extienda
                    offset: Offset(2.0, 10.0))
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            padding: EdgeInsets.only(left: 15.0),
                            child: FadeInImage(
                              image: NetworkImage(institucion['escudo']),
                              placeholder: AssetImage("assets/loading.gif"),
                              fadeInDuration: Duration(milliseconds: 200),
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              child: Text(
                                institucion["siglas"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
      cards.add(widgTemp);
      cards..add(SizedBox(height: 20.0));
    }
    return cards;
  }
}