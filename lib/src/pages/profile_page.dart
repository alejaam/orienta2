import 'package:flutter/material.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:share/share.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String texto =
      "¡Hey! Prueba esta app, te ayudará a decidir tu futuro profesional :D.";
  final String mensaje = "prueba mensaje";
  final usuarioProvider = new UsuarioProvider();
  final _prefs = PreferenciasUsuario();
  static const List<String> choices = <String>[
    'Invitar amigos',
    'Editar perfil',
    'Cerrar sesión'
  ];
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        backgroundColor: Color.fromRGBO(187, 225, 250, 1),
        appBar: AppBar(
          title: Text("Orienta2"),
          backgroundColor: Color.fromRGBO(38, 93, 130, 1),
          actions: <Widget>[
            MyActions(),
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(height: 10.0),
              _buildInfo(context, widthC),
            ],
          ),
        ));
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        Ink(
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromRGBO(69, 142, 190, 1),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 45),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.grey.shade500,
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 6.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: _prefs.foto != null
                          ? Image.network(
                              _prefs.foto,
                              width: 40,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/no-image.png',
                              fit: BoxFit.cover,
                            ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(_prefs.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(_prefs.mail,
              style:
                  TextStyle(color: Colors.black, fontStyle: FontStyle.italic))
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.email,
                          color: Color.fromRGBO(69, 142, 190, 1)),
                      title: Text("E-mail"),
                      subtitle: Text(_prefs.mail),
                    ),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.person,
                            color: Color.fromRGBO(69, 142, 190, 1)),
                        title: Text("Nombre"),
                        subtitle: Text(
                          _prefs.name,
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void choiceAction(String choice) {
    if (choice == 'Invitar amigos') {
      final RenderBox box = context.findRenderObject();
      Share.share(texto,
          subject: mensaje,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else if (choice == 'Editar perfil') {
      Navigator.pushReplacementNamed(context, 'edit_perfil');
    } else if (choice == 'Cerrar sesión') {
      usuarioProvider.signOut(context);
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
