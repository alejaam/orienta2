import 'package:flutter/material.dart';
import 'package:orientat/src/pages/home_page.dart';

class ResultadoPage extends StatelessWidget {
  final String text;
  const ResultadoPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
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
              onTap: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            resultCard(context),
            Column(
              children: <Widget>[
                SizedBox(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    textColor: Colors.white,
                    color: Color.fromRGBO(49, 59, 64, 1),
                    child: Text("Volver a inicio", style: TextStyle(fontSize: 30.0)),
                    onPressed: () {
                      final route = new MaterialPageRoute(builder: (context) {
                        return HomePage();
                      });
                      Navigator.of(context).pushReplacement(route);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget resultCard(context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      height: 250.0,
      child: Card(
        color: Color.fromRGBO(69, 142, 190, 1),
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.white)),
          //  Text(text,
          //     style: TextStyle(fontSize: 35.0, color: Colors.white)),
        ),
      ),
    );
  }
}
