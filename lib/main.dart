import 'package:flutter/material.dart';
import 'package:orientat/overboard.dart';
import 'package:orientat/splash.dart';
import 'package:orientat/src/bloc/provider.dart';
import 'package:orientat/src/pages/carreras_page.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:orientat/src/pages/instrucciones_page.dart';
import 'package:orientat/src/pages/ipn_page.dart';
import 'package:orientat/src/pages/login_page.dart';
import 'package:orientat/src/pages/mapa_page.dart';
import 'package:orientat/src/pages/noticias_page.dart';
import 'package:orientat/src/pages/planEstudios_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/pages/instituciones_page.dart';
import 'package:orientat/src/pages/registro_page.dart';
import 'package:orientat/src/pages/test_page.dart';
import 'package:orientat/src/pages/universidades_page.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
// import 'package:orientat/src/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Splash(),
          'overboard': (BuildContext context) => Overboard(),
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'instituciones': (BuildContext context) => InstitucionesPage(),
          'instrucciones': (BuildContext context) => InstruccionesPage(),
          'universidades': (BuildContext context) => UniversidadesPage(),
          'test': (BuildContext context) => TestFacil(),
          'perfil': (BuildContext context) => ProfilePage(),
          'ipn': (BuildContext context) => IpnPage(),
          // 'planteles': (BuildContext context) => PlanetelesPage(),
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
      ),
    );
  }
}
