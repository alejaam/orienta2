import 'package:flutter/material.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:share/share.dart';

class MyDrawer extends StatelessWidget {
  final String texto =
      "¡Hey! Prueba esta app, te ayudará a decidir tu futuro profesional :D.";
  final String mensaje = "prueba mensaje";
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = new UsuarioProvider();
    final _prefs = new PreferenciasUsuario();
    // final bloc = Provider.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(38, 93, 130, 1)),
            accountName: Text(_prefs.name),
            accountEmail: Text(_prefs.mail),
            currentAccountPicture: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                // Navigator.pushNamed(context, 'perfil');
                print(_prefs.mail);
                print(_prefs.name);
                print(_prefs.tokenUser);
              },
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg'),
                ),
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
              // Navigator.pop(context);
              final RenderBox box = context.findRenderObject();
              Share.share(texto,
                  subject: mensaje,
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
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
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesión'),
            onTap: () {
              usuarioProvider.signOut(context);
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
