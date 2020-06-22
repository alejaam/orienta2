import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientat/src/bloc/login_bloc.dart';
import 'package:orientat/src/bloc/provider.dart';
import 'package:orientat/src/pages/home_page.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:orientat/src/utils/utils.dart';
import 'package:orientat/utils/constants.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final usuarioProvider = new UsuarioProvider();

  bool _rememberMe = false;
  bool checkUser;
  bool checkPassword;
  bool error = false;
  bool _obscureText = true;
  String user = "";
  String password = "";
  String msg = "*Error en usuario o contraseña";
  Icon _iconPass = Icon(Icons.visibility, size: 18, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

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
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordTF(bloc),
                      _buildSignUpBtn(context, bloc)
                      // _buildSignInWithText(),
                      // _buildSocialBtnRow(),
                      // _buildSignupBtn(bloc),
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
            // Text(
            //   'Correo/Nombre de usuario',
            //   style: kLabelStyle,
            // ),
            // SizedBox(height: 10.0),
            TextField(
              onChanged: bloc.changeEmail,
              obscureText: false,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
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

  Widget _buildPasswordTF(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   'Contraseña',
            //   style: kLabelStyle,
            // ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: bloc.changePassword,
              obscureText: _obscureText,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
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
    // final bloc = Provider.of(context);

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: Column(
            children: <Widget>[
              // Container(
              //   padding: EdgeInsets.only(top: 25.0),
              //   child: Visibility(
              //     visible: error, //Default is true,
              //     child: Text(msg, style: kLabelStyleWrong),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed:
                      snapshot.hasData ? () => _register(bloc, context) : null,
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

  _register(LoginBloc bloc, BuildContext context) {
    usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- O -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Iniciar Sesión Con',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GestureDetector(
          onTap: () => print('Sign Up Button Pressed'),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '¿No estás registrado?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Regístrate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void login() {
    final route = new MaterialPageRoute(builder: (context) {
      return HomePage();
    });
    Navigator.of(context).pushReplacement(route);
  }

  _login(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, 'Correo y/o Contraseña incorrecta');
    }
  }
}
