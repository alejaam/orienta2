import 'package:flutter/material.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/providers/superiores_provider.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class UniversidadesPage extends StatelessWidget {
  const UniversidadesPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromRGBO(187, 225, 250, 1),
        // bottomNavigationBar: _bottomNavigationBar(context),
        drawer: MyDrawer(),
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
                onTap: () {
                  final route = new MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  });
                  Navigator.push(context, route);
                },
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
        body: FutureBuilder(
            future: superioresProvider.cargarData('superiores.json'),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return ListView(
                padding: EdgeInsets.all(20),
                children: _cardTipo2(snapshot.data, context),
                // children:
                //   _cardTipoTest(snapshot.data, context)
              );
            }));
  }

  List<Widget> _cardTipo2(data, context) {
    final List<Widget> instituciones = [];

    for (var institucion in data) {
      final card = GestureDetector(
        onTap: () {
          final route = new MaterialPageRoute(builder: (context) {
            return IpnPage();
          });
          Navigator.push(context, route);
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
                          Flexible(
                            child: Container(
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
                          ),
                          Container(
                            child: Text(
                              institucion['institucion'], style: TextStyle(fontWeight: FontWeight.bold),
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
