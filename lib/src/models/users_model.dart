import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String nombres;
  String apellidos;
  String correo;
  String contrasea;
  String bachiller;
  bool realizarTest;

  Usuario({
    this.id,
    this.nombres = '',
    this.apellidos = '',
    this.correo = '',
    this.contrasea = '',
    this.bachiller = '',
    this.realizarTest = false,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id            : json["id"],
    nombres       : json["nombres"],
    apellidos     : json["apellidos"],
    correo        : json["correo"],
    contrasea     : json["contraseña"],
    bachiller     : json["bachiller"],
    realizarTest  : json["realizarTest"],
  );

  Map<String, dynamic> toJson() => {
    "id"           : id,
    "nombres"      : nombres,
    "apellidos"    : apellidos,
    "correo"       : correo,
    "contraseña"   : contrasea,
    "bachiller"    : bachiller,
    "realizarTest" : realizarTest,
  };
}
