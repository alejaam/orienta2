import 'dart:io';

import 'package:orientat/src/models/usuario_model.dart';
import 'package:orientat/src/providers/usuario_provider.dart';
import 'package:rxdart/rxdart.dart';

class UsuariosBloc {
  final _usuariosController = new BehaviorSubject<List<UsuarioModel>>();
  final _cargandoController = new BehaviorSubject<bool>();
  final _usuariosProvider = new UsuarioProvider();

  Stream<List<UsuarioModel>> get usuariosStream => _usuariosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarusuarios() async {
    final usuarios = await _usuariosProvider.cargarInfoUsuario();
    _usuariosController.sink.add(usuarios);
  }

  void agregarusuarios(UsuarioModel usuario) async {
    _cargandoController.sink.add(true);
    // await _usuariosProvider.nuevoUsuario(usuario.correo, usuario.);
    _cargandoController.sink.add(true);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);
    final fotoUrl = await _usuariosProvider.subirImagen(foto);
    _cargandoController.sink.add(true);

    return fotoUrl;
  }

  Future<Map<String, dynamic>> editarUsuario(UsuarioModel usuario) async {
    _cargandoController.sink.add(true);
    return await _usuariosProvider.editarUsuario(usuario);
    // _cargandoController.sink.add(false);
  }

  void borrarUsuario(String id) async {
    // await _usuariosProvider.borrarusuario(id);
  }

  dispose() {
    _usuariosController?.close();
    _cargandoController?.close();
  }
}
