import 'package:flutter/material.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';

class SuperioresPage extends StatelessWidget {
  const SuperioresPage({Key key}) : super(key: key);

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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo2(
              'https://www.encb.ipn.mx/assets/files/encb/img/escudos/logo-ipn.png',
              'Instituto Politécnico Nacional',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Escudo-UNAM-escalable.svg/1200px-Escudo-UNAM-escalable.svg.png',
              'Universidad Nacional Autónoma de México',
              context),
          SizedBox(height: 20.0),
          _cardTipo2('http://www.uam.mx/identidad/emblemaylema/logogrande.gif',
              'Universidad Autónoma Metropolitana', context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://universidadesdemexico.mx/logos/original/logo-uvm-universidad-del-valle-de-mexico.png',
              'Unversidad del Valle de México',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://i.pinimg.com/originals/f2/7d/8c/f27d8c1b680c3c2a9fe72377d79d00b1.jpg',
              'Escuela Nacional para Maestras de Jardines de Niños',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://seeklogo.com/images/U/UPN_-_Universidad_Pedag__gica_Nacional-logo-092C2CED63-seeklogo.com.png',
              'Universidad Pedagógica Nacional',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://pbs.twimg.com/profile_images/837060980798554112/m38LPWQK.jpg',
              'Escuela Nacional de Entrenadores Deportivos',
              context),
          SizedBox(height: 20.0),
          _cardTipo2(
              'https://mextudia.com/wp-content/uploads/2018/08/Logo-Escuela-Superior-de-Educaci%C3%B3n-F%C3%ADsica.png',
              'Escuela Superior de Educación Física',
              context)
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
            print("HOLA");
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
        child:
            ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
      ),
    );
  }
}
