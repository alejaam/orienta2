import 'package:flutter/material.dart';
import 'package:orientat/splash.dart';
import 'package:orientat/src/pages/carreras_page.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/mapa_page.dart';
import 'package:orientat/src/pages/noticias_page.dart';
import 'package:orientat/src/pages/planEstudios_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/pages/resultado_page.dart';
import 'package:orientat/src/pages/superiores_page.dart';
import 'package:orientat/src/pages/test_page.dart';
import 'package:orientat/src/pages/ubicacion_page.dart';
// import 'package:orientat/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Splash(),
        'universidades': (BuildContext context) => SuperioresPage(),
        'test': (BuildContext context) => TestFacil(),
        'perfil': (BuildContext context) => ProfilePage(),
        'ipn': (BuildContext context) => IpnPage(),
        'carreras': (BuildContext context) => CarrerasPage(),
        'noticias': (BuildContext context) => NoticiasPage(),
        // 'ubicacion': (BuildContext context) => UbicacionPage(),
        'plan': (BuildContext context) => PlanEstudiosPage(),
        'others': (BuildContext context) => CarrerasPage(),
        'map': (BuildContext context) => MapaPage(),
        // 'noticias': (BuildContext context) => NoticiasPage(),
        // 'convocatorias': (BuildContext context) => ConvocatoriasPage(),
        // 'resultado': (BuildContext context) => ResultadoPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => HomePage());
      },
    );
  }
}
