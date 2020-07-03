import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  // GET y SET del tokenRefresh
  get tokenRefresh {
    return _prefs.getString('tokenRefresh') ?? '';
  }

  set tokenRefresh(String value) {
    _prefs.setString('tokenRefresh', value);
  }

  // GET y SET del primer inicio de app
  get firstInit {
    return _prefs.getBool('firstInit') ?? false;
  }

  set firstInit(bool value) {
    _prefs.setBool('firstInit', value);
  }

  // GET y SET del primer inicio de app
  get resultado {
    return _prefs.getString('resultado') ?? '';
  }

  set resultado(String value) {
    _prefs.setString('resultado', value);
  }

  // GET y SET del nombre
  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  // GET y SET del tokenUser
  get tokenUser {
    return _prefs.getString('tokenUser') ?? '';
  }

  set tokenUser(String value) {
    _prefs.setString('tokenUser', value);
  }

  // GET y SET del mail
  get mail {
    return _prefs.getString('mail') ?? '';
  }

  set mail(String value) {
    _prefs.setString('mail', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
  // GET y SET de la foto
  get foto {
    return _prefs.getString('foto') ?? '';
  }

  set foto(String value) {
    _prefs.setString('foto', value);
  }
}
