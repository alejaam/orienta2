import 'package:flutter/material.dart';

import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';

class Overboard extends StatefulWidget {
  Overboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OverboardState createState() => _OverboardState();
}

class _OverboardState extends State<Overboard> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();

    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        nextText: 'Siguiente',
        skipText: 'Omitir',
        finishText: '¡Vamos!',
        showBullets: true,
        skipCallback: () {
          _prefs.firstInit = true;
          Navigator.pushReplacementNamed(context, 'login');
        },
        finishCallback: () {
          _prefs.firstInit = true;
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Color.fromRGBO(35, 64, 82, 1),
        imageAssetPath: 'assets/planea.png',
        title: 'Planea',
        body: 'Para un futuro estable la planeación es la clave',
        doAnimateImage: true),
    PageModel(
        color: Color.fromRGBO(15, 76, 117, 1),
        imageAssetPath: 'assets/decide.png',
        title: 'Decide',
        body: '¿Tomar una decisión no es fácil?, nosostros te ayudaremos',
        doAnimateImage: true),
    PageModel(
        color: Color.fromRGBO(50, 130, 184, 1),
        imageAssetPath: 'assets/discover.png',
        title: 'Descubre',
        body: '!Escoge una carrera que vaya de acuerdo con lo que te gusta¡',
        doAnimateImage: true),
  ];
}
