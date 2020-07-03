import 'dart:convert';
import 'dart:io';

import 'package:mime_type/mime_type.dart';
import 'package:orientat/src/models/usuario_model.dart';
import 'package:orientat/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _url = 'https://orienta2-4da13.firebaseio.com';
  final String _firebaseToken = 'AIzaSyDLHuauR9ehqvosAhccZEfHj6JO9Qh_VYM';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String correo, String password) async {
    final authData = {
      'email': correo,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      _prefs.mail = correo;
      _prefs.name = decodeResp['displayName'];
      _prefs.tokenRefresh = decodeResp['refreshToken'];

      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String correo, String password, String nombre) async {
    //Creamos un arreglo con la información de la autenticación para el registro
    final authData = {
      'email': correo,
      'password': password,
      'displayName': nombre,
      'returnSecureToken': true
    };

    //Creamos un registro con la información que guardaremos en la DB
    final userData = {'nombre': nombre, 'correo': correo};

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      _prefs.mail = decodeResp['email'];
      _prefs.name = nombre;

      final url = '$_url/usuarios.json?auth=${_prefs.token}';
      final respUsuario = await http.post(url, body: json.encode(userData));
      final decodeData = json.decode(respUsuario.body);
      print(decodeData['name']);
      _prefs.tokenUser = decodeData['name'];

      final userData2 = {
        'nombre': nombre,
        'correo': correo,
        'tokenUser': _prefs.tokenUser,
        'localId': decodeResp['localId']
      };

      final url2 =
          '$_url/usuarios/${_prefs.tokenUser}.json?auth=${_prefs.token}';
      final respUsuario2 = await http.patch(url2, body: json.encode(userData2));
      final decodeData2 = json.decode(respUsuario2.body);

      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> editarUsuario(UsuarioModel usuario) async {
    // await refreshToken();
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$_firebaseToken';

    final nameData = {
      'idToken': _prefs.token,
      'displayName': usuario.nombre,
      'returnSecureToken': true
    };

    final respChangeName = await http.post(url, body: json.encode(nameData));
    Map<String, dynamic> decodeRespName = json.decode(respChangeName.body);

    if (decodeRespName.containsKey('displayName')) {
      _prefs.name = decodeRespName['displayName'];
    }
    if (usuario.correo != _prefs.mail) {
      final emailData = {
        'idToken': _prefs.token,
        'email': usuario.correo.toString(),
        'returnSecureToken': true
      };

      final respChangeMail = await http.post(url, body: json.encode(emailData));
      Map<String, dynamic> decodeRespEmail = json.decode(respChangeMail.body);

      if (decodeRespEmail.containsKey('email')) {
        _prefs.mail = decodeRespEmail['email'];
        _prefs.token = decodeRespEmail['idToken'];
        return {'ok': true, 'token': decodeRespEmail['email']};
      } else {
        return {'ok': false, 'mensaje': decodeRespEmail['error']['message']};
      }
    }
    return {'ok': true};
  }

  Future<List<UsuarioModel>> cargarInfoUsuario() async {
    final String url = '$_url/usuarios.json?auth=${_prefs.token}';
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

  Future<Map<String, dynamic>> refreshToken() async {
    final authData = {
      'grant_type': 'refresh_token',
      'refresh_token': _prefs.tokenRefresh
    };

    final resp = await http.post(
        'https://securetoken.googleapis.com/v1/token?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('id_token')) {
      _prefs.token = decodedResp['id_token'];
      return {'ok': true, 'token': decodedResp['id_token']};
    } else {
      // Algo salio mal
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/alejaam/image/upload?upload_preset=ewgreeqc');
    final mimeType = mime(imagen.path).split('/');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }

  void signOut(context) {
    _prefs.token = '';
    _prefs.mail = '';
    _prefs.name = '';
    _prefs.tokenUser = '';
    _prefs.foto = '';
  }

  bool get isAuthenticated {
    print(this._prefs.token);
    return (this._prefs.token == '');
  }
}
