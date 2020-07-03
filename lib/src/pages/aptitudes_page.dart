import 'package:flutter/material.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:orientat/utils/icono_string_util.dart';
import 'package:url_launcher/url_launcher.dart';

class AptitudesPage extends StatefulWidget {
  const AptitudesPage({Key key}) : super(key: key);

  @override
  _AptitudesPageState createState() => _AptitudesPageState();
}

class _AptitudesPageState extends State<AptitudesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _bottomNavigationBar(context),
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      drawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Color.fromRGBO(187, 225, 250, 1)),
          child: MyDrawer()),
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
                Navigator.pushNamed(context, 'perfil');
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
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              "Misión ",
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
                child: Divider(
              height: 50.0,
              color: Colors.black,
            )),
          ]),
          SizedBox(height: 20.0),
          _cardTipo1(
              "La Unidad Profesional Interdisciplinaria de Ingeniería y Ciencias Sociales y Administrativas, es una institución educativa de nivel superior y posgrado comprometida en la formación integral e interdisciplinaria de profesionales e investigadores emprendedores y de alto nivel académico en las áreas de ingeniería, administración e informática, contribuyendo al desarrollo económico, social y sustentable a nivel nacional e internacional, contando con una estructura académica y de personal de apoyo calificada, infraestructura de vanguardia, así como con tecnologías vigentes."),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            Text(
              "Visión ",
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
                child: Divider(
              height: 50.0,
              color: Colors.black,
            )),
          ]),
          SizedBox(height: 20.0),
          _cardTipo1(
              "Ser la Unidad Académica interdisciplinaria líder en su oferta académica, incluyente, de prestigio nacional e internacional, que forme generaciones de profesionales responsables y honestos, innovadores y emprendedores, que diseñen e implanten soluciones con un alto respeto a la vida y responsabilidad social, estableciendo modelos disyuntivos que contribuyan al desarrollo social, económico y de la innovación tecnológica del país, interactuando en una economía mundial."),
        ],
      ),
    );
  }

  Widget _cardTipo1(body) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            // title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                body,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2(string, url) {
    // final random = Random();
    // int imagen = random.nextInt(300);
    final card = GestureDetector(
      onTap: () {
        _launchURL(
            'https://www.infobae.com/america/mexico/2020/04/08/uam-buap-anahuac-y-mas-universidades-tambien-retiraran-internos-de-hospitales-ante-covid-19/');
      },
      // clipBehavior: Clip.antiAlias,
      child: Container(
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(url),
              placeholder: AssetImage("assets/loading.gif"),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                string,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );

    return Container(
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
      child: ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
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
