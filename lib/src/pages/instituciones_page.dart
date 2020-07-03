import 'package:flutter/material.dart';
import 'package:orientat/src/pages/planteles_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/superiores_provider.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class InstitucionesPage extends StatelessWidget {
  // const InstitucionesPage({Key key}) : super(key: key);
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(187, 225, 250, 1),
        // bottomNavigationBar: _bottomNavigationBar(context),
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Orienta2"),
          backgroundColor: Color.fromRGBO(38, 93, 130, 1),
          actions: <Widget>[
            MyActions(),
          ],
        ),
        body: FutureBuilder(
            future: superioresProvider.cargarData('superiores.json'),
            initialData: [],
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  padding: EdgeInsets.all(20),
                  children: _cardTipo2(snapshot.data, context),
                  // _cardTipoTest(snapshot.data, context)
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ));
              }
            }));
  }

  List<Widget> _cardTipo2(data, context) {
    final List<Widget> instituciones = [];

    for (var institucion in data) {
      final card = GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PlanetelesPage(escuelas: institucion["escuelas"]),
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
                                institucion["institucion"],
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
      instituciones..add(card);
      instituciones..add(SizedBox(height: 20.0));
    }
    return instituciones;
  }
}
