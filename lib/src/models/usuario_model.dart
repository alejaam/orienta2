import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  String id;
  String nombre;
  String apellido;
  String correo;
  String universidad;

  UsuarioModel({
    this.id,
    this.nombre = '',
    this.apellido = '',
    this.correo = '',
    this.universidad,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        universidad: json["universidad"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "universidad": universidad,
      };
}
