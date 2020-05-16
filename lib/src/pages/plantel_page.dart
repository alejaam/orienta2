import 'package:flutter/material.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:orientat/utils/icono_string_util.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanetelPage extends StatelessWidget {
  // const PlanetelPage({Key key}) : super(key: key);
  final List<dynamic> plantel;
  PlanetelPage({Key key, @required this.plantel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Universidad universidad = ModalRoute.of(context).settings.arguments;

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
          children: _cardsPlantel(context, plantel)),
    );
  }

  List<Widget> _cardsPlantel(context, List<dynamic> plantel) {
    final List<Widget> cards = [];
    for (var item in plantel) {
      final widgTemp = _cardTipo1(item);
      cards.add(widgTemp);
      cards..add(SizedBox(height: 20.0));
    }
    return cards;
  }

  Widget _cardTipo1(plantel) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.school, color: Colors.blue),
            title: Text(plantel["carrera"]),
            subtitle: Text("Duración: " + plantel['duracion'].toString() + " Semestres"),
            trailing: getIcon("school"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Ver plan"),
                onPressed: () {
                  _launchURL(plantel["plan"]);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
