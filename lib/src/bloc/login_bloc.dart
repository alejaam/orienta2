import 'dart:async';

import 'package:orientat/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  //Haremos 2 controladores, uno para el email y otro para el password
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  //Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener el útimo valor ingresado a los Streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController.value = '';
    _passwordController.value = '';
    _emailController?.close();
    _passwordController?.close();
  }
}
