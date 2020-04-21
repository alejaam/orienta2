import 'package:flutter/material.dart';
import 'package:orientat/src/pages/login_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginPage(),
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


