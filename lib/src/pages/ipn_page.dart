import 'package:flutter/material.dart';
import 'package:orientat/src/providers/menu_provider.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:orientat/utils/icono_string_util.dart';

class IpnPage extends StatefulWidget {
  IpnPage({Key key}) : super(key: key);

  @override
  _IpnPageState createState() => _IpnPageState();
}

class _IpnPageState extends State<IpnPage> {
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
        actions: <Widget>[
          MyActions()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: _buildCards(),
      ),
    );
  }
}

Widget _buildCards() {
    return FutureBuilder(
      future: menuProvider.cargarData("universidades_opts.json"),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return GridView.count(
            crossAxisCount: 2, children: _cardItems(snapshot.data, context));
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
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Color.fromRGBO(69, 142, 190, 1),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  switch (opt['ruta']) {
                    case 'universidades':
                      Navigator.pushNamed(context, opt['ruta']);
                      break;
                    case 'test':
                      Navigator.pushReplacementNamed(context, opt['ruta']);
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