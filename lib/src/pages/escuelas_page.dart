// import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:orientat/src/pages/esfm_page.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/pages/upiicsa_page.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class EscuelasPage extends StatelessWidget {
  const EscuelasPage({Key key}) : super(key: key);

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
          _cardTipo2(
              'https://www.cics-sto.ipn.mx/assets/files/cics-sto/img/conocenos/udi/logoCICSSTf.png',
              'CICS',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://upload.wikimedia.org/wikipedia/commons/f/f6/Escudo_de_la_ENBA.png',
              'ENBA',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.encb.ipn.mx/assets/files/encb/img/escudos/escudoENCB.png',
              'ENCB',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://4.bp.blogspot.com/-fu9FgL4Attc/U2XMzLM-G0I/AAAAAAAALHc/rB5JBjC5ij8/s1600/LOGO_ENMH.jpg',
              'ENMyH',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.ese.ipn.mx/assets/files/ese/img/Inicio/Escudo%20Banderin/Escudo-ese.jpg',
              'ESE',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.esfm.ipn.mx/assets/files/esfm/img/ESCUDO_ESFM.png',
              'ESFM',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.eseo.ipn.mx/assets/files/eseo/img/LOGO/BANDERINESEO.png',
              'ESEO',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.escasto.ipn.mx/assets/files/esca-sto/img/ESCASTO-C.png',
              'ESCA',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://pngimage.net/wp-content/uploads/2018/05/escom-png-1.png',
              'ESCOM',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://pbs.twimg.com/profile_images/1423918272/esimetwitter_400x400.png',
              'ESIME',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.esiqie.ipn.mx/assets/files/esiqie/img/Conocenos/Historia/ESIQIE.jpg',
              'ESIQIE',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.esit.ipn.mx/assets/files/esit/uploads/ESIT.png',
              'ESIT',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.esiatec.ipn.mx/assets/files/esiatec/img/conocenos/mision-vision/banderin-esia.png',
              'ESIA',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.esm.ipn.mx/assets/files/esm/img/conocenos/misionvision/logoesm1.png',
              'ESM',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.sepi.upibi.ipn.mx/assets/files/sepi-upibi/img/OTROS/BANDERIN.png',
              'UPIBI',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.upiig.ipn.mx/assets/files/upiig/img/Iconos/LogoUPIIG.png',
              'UPIIG',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.elimparcial.com/__export/1556969446111/sites/elimparcial/img/2016/02/12/1358479-N.JPG_423682103.jpg',
              'UPIIZ',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://www.upiicsa.ipn.mx/assets/files/upiicsa/Inicio/ICON-UPIICSA.png',
              'UPIICSA',
              context),
          SizedBox(height: 20.0),
          _cardTipo2('https://www.upiita.ipn.mx/images/upiita-logo.png',
              'UPIITA', context)
        ],
      ),
    );
  }

  Widget _cardTipo2(url, school, context) {
    final card = Container(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 120,
                height: 100,
                padding: EdgeInsets.only(left: 15.0),
                child: FadeInImage(
                  image: NetworkImage(url),
                  placeholder: AssetImage("assets/loading.gif"),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
        switch (school) {
          case 'UPIICSA':
            final route = new MaterialPageRoute(builder: (context) {
              return UpiicsaPage();
            });
            Navigator.push(context, route);
            break;
          case 'ESFM':
            final route = new MaterialPageRoute(builder: (context) {
              return EsfmPage();
            });
            Navigator.push(context, route);
            break;
          default:
        }
        print("HOLA");
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
}
