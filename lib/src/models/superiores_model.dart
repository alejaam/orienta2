import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    int id;
    String nombre;
    String institucion;
    String clave;
    int tipo;
    List<String> carreras;
    bool realizarTest;

    Usuario({
        this.id,
        this.nombre,
        this.institucion,
        this.clave,
        this.tipo,
        this.carreras,
        this.realizarTest,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        institucion: json["institucion"],
        clave: json["clave"],
        tipo: json["tipo"],
        carreras: List<String>.from(json["carreras"].map((x) => x)),
        realizarTest: json["realizarTest"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "institucion": institucion,
        "clave": clave,
        "tipo": tipo,
        "carreras": List<dynamic>.from(carreras.map((x) => x)),
        "realizarTest": realizarTest,
    };
}
