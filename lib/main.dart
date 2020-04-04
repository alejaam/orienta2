import 'package:flutter/material.dart';
import 'package:orientat/splash.dart';
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
      },
      // home: Splash(),
    );
  }
}