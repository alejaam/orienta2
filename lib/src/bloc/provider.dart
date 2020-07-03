import 'package:flutter/material.dart';
import 'package:orientat/src/bloc/login_bloc.dart';
import 'package:orientat/src/bloc/usuarios_bloc.dart';


class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();
  final usuarioBloc = UsuariosBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //Cuando usemos este provider ocupamos la instancia del login bloc, que regrese el estado como esta este loginBloc
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc);
  }
  static UsuariosBloc usuariosBloc (BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().usuarioBloc);
  }
  // static ProductosBloc productosBloc (BuildContext context) {
  //   return (context.dependOnInheritedWidgetOfExactType<Provider>()._productosBloc);
  // }
}
