import 'package:flutter/material.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/menu_provider.dart';
import 'package:orientat/src/utils/utils.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:orientat/utils/icono_string_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _bottomNavigationBar(context),
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      drawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Color.fromRGBO(187, 225, 250, 1)),
          child: MyDrawer()),
      appBar: AppBar(
        title: Text("Orienta2"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[MyActions()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildCards(),
      ),
    );
  }

  Widget _buildCards() {
    return FutureBuilder(
      future: menuProvider.cargarData("menu_opts.json"),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
              crossAxisCount: 2, children: _cardItems(snapshot.data, context));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _cardItems(List<dynamic> data, context) {
    final List<Widget> opciones = [];
    for (var opt in data) {
      if (opt['ruta'] == 'perfil') {
        continue;
      }
      final widgetTemp = GestureDetector(
        onTap: () {},
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              color: Color.fromRGBO(69, 142, 190, 1),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  switch (opt['ruta']) {
                    case 'instituciones':
                      Navigator.pushNamed(context, opt['ruta']);
                      break;
                    case 'test':
                      _mostrarAlerta(context);
                      break;
                    case 'convocatorias':
                      mostrarAlerta(context,
                          "POR EL COVID-19 AÚN NO HAY INFORMACIÓN PRECISA");
                      break;
                    default:
                      Navigator.pushNamed(context, opt['ruta']);
                  }
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
                          child: getIcon(opt['icon']),
                        ),
                        new Center(
                          child: new Text(opt['texto'],
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
      opciones..add(widgetTemp);
    }
    return opciones;
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
            contentPadding: EdgeInsets.all(5),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, //El contenido interno dice el tamaño
                children: <Widget>[
                  ListTile(
                    title: Text(
                        "A continuación te haremos una serie de 80 preguntas y enunciados(Bastante rápidas)"),
                  ),
                  ListTile(
                    title: Text(
                        "1. Contestala con toda sinceridad para obtener un resultado más preciso"),
                  ),
                  ListTile(
                    title: Text(
                        "2. Las respuestas solo son 2, Me agrada o me desagrada"),
                  ),
                  ListTile(
                    title: Text("3. No podrás salir del test hasta finalizar"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    color: Color.fromRGBO(69, 142, 190, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("Aceptar"),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'test');
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  // Widget _bottomNavigationBar(context) {
  //   return Theme(
  //     data: Theme.of(context).copyWith(
  //         canvasColor: Color.fromRGBO(69, 142, 190, 1),
  //         primaryColor: Color.fromRGBO(49, 59, 64, 1),
  //         textTheme: Theme.of(context).textTheme.copyWith(
  //             caption: TextStyle(color: Color.fromRGBO(193, 227, 250, 1)))),
  //     child: BottomNavigationBar(
  //       currentIndex: 0,
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home, size: 30), title: Container()),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.bubble_chart, size: 30), title: Container()),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.perm_identity, size: 30), title: Container())
  //       ],
  //       onTap: (index) {},
  //     ),
  //   );
  // }
}
