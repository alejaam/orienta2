import 'package:flutter/material.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomePage(),
      title: new Text('Orienta-T',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
        color: Colors.white
      ),),
      // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Color.fromRGBO(38, 93, 130, 1),
      styleTextUnderTheLoader: new TextStyle(),
      // photoSize: 100.0,
      onClick: ()=>print("No desesperes"),
      loaderColor: Colors.white,
      loadingText: Text("All rigths reserved."),
    );
  }
}