import 'package:flutter/material.dart';
import 'package:orientat/overboard.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:orientat/src/pages/login_page.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final usuarioProvider = new UsuarioProvider();
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds:
          usuarioProvider.isAuthenticated ? _prefs.firstInit? LoginPage() : Overboard() : HomePage(),
      title: Text(
        'Orienta2',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.white),
      ),
      // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Color.fromRGBO(38, 93, 130, 1),
      styleTextUnderTheLoader: TextStyle(),
      // photoSize: 100.0,
      onClick: () => print("No desesperes"),
      loaderColor: Color.fromRGBO(69, 142, 190, 1),
      loadingText:
          Text("All rigths reserved.", style: TextStyle(color: Colors.white)),
    );
  }
}
