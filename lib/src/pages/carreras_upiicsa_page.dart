// import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CarrerasUpiicsaPage extends StatelessWidget {
  const CarrerasUpiicsaPage({Key key}) : super(key: key);

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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo2('Ingeniería en Informática', context),
          SizedBox(height: 20.0),
          _cardTipo2('Ingeniería en Transporte', context),
          SizedBox(height: 20.0),
          _cardTipo2('Ingeniería Industrial', context),
          SizedBox(height: 20.0),
          _cardTipo2('Licenciatura en Ciencias de la Informática', context),
          SizedBox(height: 20.0),
          _cardTipo2('Licenciatura en Administración Industrial', context),
        ],
      ),
    );
  }

  Widget _cardTipo2(school, context) {
    final card = Container(
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                school,
              ),
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        print("HOLA");
        Navigator.pushNamed(context, 'aptitudes_informatica');
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
        child:
            ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
