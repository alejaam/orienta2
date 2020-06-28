import 'dart:convert';

import 'package:orientat/src/models/usuario_model.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _url = 'https://orienta2-4da13.firebaseio.com';
  final String _firebaseToken = 'AIzaSyDLHuauR9ehqvosAhccZEfHj6JO9Qh_VYM';
  final _prefs = new PreferenciasUsuario();
  
  Future<Map<String, dynamic>> login(String email, String password) async {

    final authData = {
      'email'             : email,
      'password'          : password,
      'returnSecureToken' : true
    };

    // print(authData);
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      _prefs.mail = email;
      _prefs.name = decodeResp['displayName'];
      List<UsuarioModel> usuarios = await cargarInfoUsuario();
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String password, String nombre) async {
    final String _firebaseToken = 'AIzaSyDLHuauR9ehqvosAhccZEfHj6JO9Qh_VYM';

    //Creamos un arreglo con la información de la autenticación para el registro
    final authData = {
      'email'             : email,
      'password'          : password,
      'displayName'       : nombre,
      'returnSecureToken' : true
    };

    //Creamos un registro con la información que guardaremos en la DB
    final userData = {'nombre': nombre, 'email': email};

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      _prefs.mail = email;
      _prefs.name = nombre;

      final url = '$_url/usuarios.json?auth=${_prefs.token}';
      final respUsuario = await http.post(url, body: json.encode(userData));
      final decodeData = json.decode(respUsuario.body);
      print(decodeData['name']);
      _prefs.tokenUser = decodeData['name'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<List<UsuarioModel>> cargarInfoUsuario() async {
    final String url = '$_url/usuarios/${_prefs.tokenUser}.json?auth=${_prefs.token}';
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<UsuarioModel> usuarios = new List();

    if (decodeData == null) return [];
    if (decodeData['error'] != null) return [];

    decodeData.forEach((id, user) {
      final userTemp = UsuarioModel.fromJson(user);
      userTemp.id = id;
      usuarios.add(userTemp);
    });

    return usuarios;
  }

  void signOut(context) {
    _prefs.token = '';
    _prefs.mail = '';
    _prefs.name = '';
    _prefs.tokenUser = '';
  }

  bool get isAuthenticated {
    print(this._prefs.token);
    return (this._prefs.token == '');
  }
}
