import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientat/src/bloc/login_bloc.dart';
import 'package:orientat/src/bloc/provider.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:orientat/src/utils/utils.dart';
import 'package:orientat/utils/constants.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final usuarioProvider = new UsuarioProvider();
  bool checkUser;
  bool checkPassword;
  bool _obscureText = true;
  Icon _iconPass = Icon(Icons.visibility, size: 18, color: Colors.white);
  final _text = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    print(bloc.email);
    print(bloc.password);

    return Scaffold(
      backgroundColor: Color.fromRGBO(69, 142, 190, 1),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Registro',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(bloc),
                      SizedBox(height: 10.0),
                      _buildNameTF(bloc),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(bloc),
                      _buildSignUpBtn(context, bloc),
                      _buildForgotPasswordBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: bloc.changeEmail,
              obscureText: false,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                hintText: 'example@example.com',
                hintStyle: TextStyle(color: Colors.white70),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                focusColor: Colors.white,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: "Correo",
                errorText: snapshot.error,
                prefixIcon: Icon(
                  Icons.email,
                  size: 18,
                  color: Colors.white,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.alternate_email,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNameTF(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _text,
              onChanged: (text) {
                bloc.changeName(text);
                if (text.length <= 0) {
                  setState(() {
                    _validate = true;
                  });
                } else {
                  setState(() {
                    _validate = false;
                  });
                }
              },
              obscureText: false,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                focusColor: Colors.white,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: "Nombre",
                errorText: _validate ? "El nombre es obligatorio" : null,
                prefixIcon: Icon(
                  Icons.portrait,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordTF(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: bloc.changePassword,
              obscureText: _obscureText,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                focusColor: Colors.white,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: "Contraseña",
                errorText: snapshot.error,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 18,
                  color: Colors.white,
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      // model.isVisible = !model.isVisible;
                      setState(() {
                        _obscureText = !_obscureText;
                        _iconPass = (_obscureText)
                            ? Icon(Icons.visibility,
                                size: 18, color: Colors.white)
                            : Icon(Icons.visibility_off,
                                size: 18, color: Colors.white);
                      });
                    },
                    child: _iconPass),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSignUpBtn(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: snapshot.hasData && _text.text.isNotEmpty
                      ? () => _register(bloc, context)
                      : null,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Text(
                    'REGISTRARSE',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      // alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          '¿Ya tienes cuenta?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.nuevoUsuario(
        bloc.email, bloc.password, bloc.name);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, 'El correo ya esta registrado');
    }
  }
}
