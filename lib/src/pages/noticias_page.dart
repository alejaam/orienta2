import 'package:flutter/material.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key key}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
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
        actions: <Widget>[MyActions()],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(height: 20.0),
          _cardTipo2(
              "Amplía politécnico registro en  línea para nivel superior",
              'https://periodicoeltiempo.mx/wp-content/uploads/2020/04/10-POLITECNICO.jpg',
              'https://eltiempomonclova.mx/noticia/2020/amplia-politecnico-registro-en-linea-para-nivel-superior.html'),
          SizedBox(height: 20.0),
          _cardTipo2(
              "Convoca SEP a ingresar al nivel superior en modalidad Abierta y a Distancia",
              'https://www.diariodemorelos.com/noticias/sites/default/files/field/image/Convoca%20SEP%20a%20ingresar%20al%20nivel%20superior%20en%20modalidad%20Abierta%20y%20a%20Distancia.jpg',
              'https://www.unadmexico.mx/index.php/eventos/577-convoca-sep-a-ingresar-al-nivel-superior-en-modalidad-abierta-y-a-distancia#:~:text=Convoca%20SEP%20a%20ingresar%20al%20nivel%20superior%20en%20modalidad%20Abierta%20y%20a%20Distancia&text=Al%20ser%20en%20l%C3%ADnea%2C%20no,m%C3%A1s%20de%2040%20programas%20educativos.'),
          SizedBox(height: 20.0),
          _cardTipo2(
              "Lanzan convocatoria para becas de nivel superior y posgrado",
              'https://www.elheraldodechihuahua.com.mx/local/noroeste/lbj8n7-1-en-madera-lanzan-convocatoria-para-becas-de-media-superior-y-posgrado-foto-municipio-de-madera.jpg/alternates/LANDSCAPE_768/1%20En%20Madera,%20lanzan%20convocatoria%20para%20becas%20de%20media%20superior%20y%20posgrado%20FOTO%20MUNICIPIO%20DE%20MADERA.jpg',
              'https://www.elheraldodechihuahua.com.mx/local/noroeste/lanzan-convocatoria-para-becas-de-nivel-media-superior-y-posgrado-noticias-de-madera-5032856.html'),
          SizedBox(height: 20.0),
          _cardTipo2(
              "Aplaza UNAM convocatoria de pase reglamentado a nivel superior",
              'https://www.jornada.com.mx/ultimas/2020/04/01/aplaza-unam-convocatoria-de-pase-reglamentado-a-nivel-superior-9388.html/convocatoria.jpg-8809.html/image_large',
              'https://www.jornada.com.mx/ultimas/sociedad/2020/04/01/aplaza-unam-convocatoria-de-pase-reglamentado-a-nivel-superior-9388.html'),
          SizedBox(height: 20.0),
          _cardTipo2(
              "UAM, BUAP, Anáhuac y más universidades también retirarán internos de hospitales ante COVID-19",
              'https://www.infobae.com/new-resizer/5vzkSH87fSvhU3KsCXX17cwK8-M=/750x0/filters:quality(100)/arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/YWAO3IQUIVHVTCPIL2WMM75K4I.jpeg',
              'https://www.infobae.com/america/mexico/2020/04/08/uam-buap-anahuac-y-mas-universidades-tambien-retiraran-internos-de-hospitales-ante-covid-19/'),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _cardTipo2(string, url, noticia) {
    // final random = Random();
    // int imagen = random.nextInt(300);
    final card = GestureDetector(
      onTap: () {
        _launchURL(noticia);
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
