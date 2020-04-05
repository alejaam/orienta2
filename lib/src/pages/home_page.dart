import 'package:flutter/material.dart';
import 'package:orientat/src/pages/profile_page.dart';
import 'package:orientat/src/pages/superiores_page.dart';
import 'package:orientat/src/pages/testfacil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      drawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Color.fromRGBO(187, 225, 250, 1)),
          child: menuLateral()),
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
                Navigator.pushReplacement(context, route);
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              cards(context, "Universidades"),
              cards(context, "Test"),
              cards(context, "Noticias"),
              cards(context, "Convocatorias")
            ],
          ),
        ),
      ),
    );
  }

  Widget cards(context, String item) {
    Widget content = new GestureDetector();
    switch (item) {
      case "Universidades":
        content = GestureDetector(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color.fromRGBO(69, 142, 190, 1),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    final route = new MaterialPageRoute(builder: (context) {
                  return SuperioresPage();
                });
                Navigator.push(context, route);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Center(
                              child: Icon(
                            Icons.school,
                            size: 40.0,
                            color: Colors.white,
                          )),
                          new Center(
                            child: new Text(item,
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        break;
      case "Test":
        content = GestureDetector(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color.fromRGBO(69, 142, 190, 1),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    _mostrarAlerta(context);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                              child: Icon(
                            Icons.assignment,
                            size: 40.0,
                            color: Colors.white,
                          )),
                          new Center(
                            child: new Text(item,
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        break;
      case "Noticias":
        content = GestureDetector(
          onTap: () {
            print("Hola");
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color.fromRGBO(69, 142, 190, 1),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                              child: Icon(
                            Icons.description,
                            size: 40.0,
                            color: Colors.white,
                          )),
                          new Center(
                            child: new Text(item,
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        break;
      case "Convocatorias":
        content = GestureDetector(
          onTap: () {
            print("Hola");
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color.fromRGBO(69, 142, 190, 1),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                              child: Icon(
                            Icons.calendar_today,
                            size: 40.0,
                            color: Colors.white,
                          )),
                          new Center(
                            child: new Text(item,
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        break;
      default:
    }

    return content;
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("Instrucciones"),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min, //El contenido interno dice el tamaño
              children: <Widget>[
                ListTile(
                  title: Text(
                      "1. A continuación ta haremos una serie de 80 preguntas y enunciados(Bastante rápidas)"),
                ),
                ListTile(
                  title: Text(
                      "2. Contestala con toda sinceridad para obtener un resultado más preciso"),
                ),
                ListTile(
                  title: Text(
                      "3. Las respuestas solo son 2: Me agrada o me desagrada"),
                ),
                ListTile(
                  title: Text(
                      "4. No podrás salir del test hasta finalizar"),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Aceptar"),
                    onPressed: () {
                      final route = MaterialPageRoute(builder: (context) {
                        return TestFacil();
                      });
                      Navigator.pushReplacement(context, route);
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  Widget _bottomNavigationBar(context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(69, 142, 190, 1),
          primaryColor: Color.fromRGBO(49, 59, 64, 1),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(193, 227, 250, 1)))),
      child: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity, size: 30), title: Container())
        ],
        onTap: (index) {},
      ),
    );
  }

  Widget menuLateral() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(38, 93, 130, 1)
            ),
            accountName: Text("Alejandro Alamar"),
            accountEmail: Text("ale.jaam7@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_activity),
            title: Text('Orienta-T Pro'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Compartir'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Row(children: <Widget>[
            Expanded(child: Divider()),
          ]),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Calificar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
