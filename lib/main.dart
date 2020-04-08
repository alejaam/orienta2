import 'package:flutter/material.dart';
import 'package:orientat/splash.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/pages/resultado_page.dart';
import 'package:orientat/src/pages/superiores_page.dart';
import 'package:orientat/src/pages/test_page.dart';
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
