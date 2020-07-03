import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orientat/src/bloc/login_bloc.dart';
import 'package:orientat/src/bloc/provider.dart';
import 'package:orientat/src/bloc/usuarios_bloc.dart';
import 'package:orientat/src/models/usuario_model.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:orientat/src/utils/utils.dart';
import 'package:orientat/src/widgets/action.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final usuarioProvider = new UsuarioProvider();
  final _prefs = PreferenciasUsuario();
  // UsuariosBloc usuarioBloc;

  final usuario = new UsuarioModel();
  bool _validate = false;
  static const List<String> choices = <String>['Cancelar'];
  final ImagePicker _picker = ImagePicker();
  File foto;

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = Provider.usuariosBloc(context);
    final bloc = LoginBloc();
    bloc.changeEmail(_prefs.mail);
    bloc.changeName(_prefs.name);
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
            // Padding(
            //   padding: const EdgeInsets.only(right: 15.0),
            //   child: Center(child: Text("ale_jaam")),
            // ),
          ],
        ),
        floatingActionButton: StreamBuilder(
            stream: bloc.formValidStreamUpdate,
            builder: (context, snapshot) {
              return Visibility(
                visible: !snapshot.hasError && bloc.email != _prefs.mail ||
                        bloc.name != _prefs.name ||
                        foto != null
                    ? bloc.name == '' || bloc.email == '' ? false : true
                    : false,
                child: FloatingActionButton(
                  onPressed: () {
                    _save(bloc, usuarioBloc);
                  },
                  backgroundColor: Color.fromRGBO(38, 93, 130, 1),
                  child: Icon(Icons.save),
                ),
              );
            }),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(height: 10.0),
              _buildInfo(context, bloc),
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
              Stack(children: <Widget>[
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
                    child: GestureDetector(
                      onTap: _seleccionarFoto,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: foto != null
                            ? Image.file(
                                foto,
                                fit: BoxFit.cover,
                                height: 300.0,
                              )
                            : _prefs.foto != null
                                ? Image.network(_prefs.foto, fit: BoxFit.cover)
                                : Image.asset('assets/no-image.png',
                                    fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                            size: 22.0,
                          )),
                      onTap: () {
                        setState(() {
                          if (foto != null) {
                            _showDialog(context);
                          }
                        });
                      }),
                ),
              ]),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildInfo(BuildContext context, LoginBloc bloc) {
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
                      _buildEmail(bloc),
                      Divider(),
                      _buildName(bloc),
                    ],
                  )
                ],
              ))),
    );
    //   },
    // );
  }

  Widget _buildEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: _prefs.mail,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            fillColor: Color.fromRGBO(230, 230, 230, 0.5),
            errorText: snapshot.error,
            prefixIcon:
                Icon(Icons.mail, color: Color.fromRGBO(69, 142, 190, 1)),
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // focusColor: Colors.white,
            filled: true,
            // errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              // borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromRGBO(69, 142, 190, 1)),
            ),
            labelText: "Email",
          ),
        );
      },
    );
  }

  Widget _buildName(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          initialValue: _prefs.name,
          onChanged: bloc.changeName,
          decoration: InputDecoration(
            fillColor: Color.fromRGBO(230, 230, 230, 0.5),
            errorText: snapshot.error,
            prefixIcon:
                Icon(Icons.person, color: Color.fromRGBO(69, 142, 190, 1)),
            labelStyle: TextStyle(color: Colors.black),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromRGBO(69, 142, 190, 1)),
            ),
            labelText: "Nombre",
          ),
        );
      },
    );
  }

  void choiceAction(String choice) {
    if (choice == 'Cancelar') {
      Navigator.pop(context);
    } else if (choice == 'Editar perfil') {
      print('Subscribe');
    } else if (choice == 'Cerrar sesión') {
      usuarioProvider.signOut(context);
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  Future _save(LoginBloc bloc, UsuariosBloc usuarioBloc) async {
    usuario.nombre = bloc.name;
    usuario.correo = bloc.email;
    if (foto != null) {
      usuario.fotoUrl = await usuarioBloc.subirFoto(foto);
      _prefs.foto = usuario.fotoUrl;
    }
    try {
      Map info = await usuarioBloc.editarUsuario(usuario);
      if (info['ok']) {
        Navigator.pushReplacementNamed(context, 'perfil');
      } else {
        if (info['mensaje'] == 'INVALID_ID_TOKEN') {
          mostrarAlerta(context, 'Vuelve a iniciar sesión');
          usuarioProvider.signOut(context);
          // bloc.dispose();ale
          Navigator.pushReplacementNamed(context, 'login');
        } else {
          mostrarAlerta(context, 'El correo ya existe.');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  _mostrarFoto() {
    if (usuario.fotoUrl != null) {
      return FadeInImage(
          image: NetworkImage(usuario.fotoUrl),
          placeholder: AssetImage('assets/jar-loading.gif'),
          height: 300.0,
          fit: BoxFit.cover);
    } else {
      if (foto != null) {
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    final imagen = await _picker.getImage(source: origen);
    if (imagen != null) {
      usuario.fotoUrl = null;
    }
    setState(() {
      foto = File(imagen?.path ?? 'assets/no-image.png');
      _prefs.foto = imagen.path.toString();
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("Alerta"),
            contentPadding: EdgeInsets.all(5),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, //El contenido interno dice el tamaño
                children: <Widget>[
                  ListTile(
                    title: Text("¿Seguro que desea eliminar su imagen?"),
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
                      setState(() {
                        foto = null;
                      });
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          );
        });
  }
}
