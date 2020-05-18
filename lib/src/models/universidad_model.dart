class Superiores {
  List<Superior> items = [];

  Superiores();

  Superiores.fromJsonMap(List<dynamic> json) {
    if (json == null) return;

    for (var item in json) {
      final superior = Superior.fromJsonMap(item);
      items.add(superior);
    }
  }
}

class Superior {
  String institucion;
  String escudo;
  List<Escuela> escuelas;

  Superior({this.institucion, this.escudo, this.escuelas});

  Superior.fromJsonMap(Map<String, dynamic> json) {
    institucion = json['institucion'];
    escudo = json['escudo'];
    for (var item in json['escuelas']) {
      final escuela = Escuela.fromJsonMap(item);
      escuelas.add(escuela);
    }
  }
}

class Escuela {
  String nombre;
  String siglas;
  String escudo;
  List<Ubicacion> ubicacion = [];
  List<Carrera> carreras = [];

  Escuela({
    this.nombre,
    this.siglas,
    this.escudo,
    this.ubicacion,
    this.carreras,
  });

  Escuela.fromJsonMap(Map<String, dynamic> json) {
    // for (var item in json) {
    nombre = json["nombre"];
    siglas = json["siglas"];
    escudo = json["escudo"];
    for (var item in json["carreras"]) {
      final carrera = Carrera.fromJsonMap(item);
      carreras.add(carrera);
    }

    for (var item in json["ubicacion"]) {
      final ubicacion = Ubicacion.fromJsonMap(item["ubicacion"]);
      this.ubicacion.add(ubicacion);
    }
    // }
  }
}

class Carrera {
  // List<Carrera> carreras = [];
  String carrera;
  double duracion;
  String plan;

  Carrera({this.carrera, this.duracion, this.plan});

  Carrera.fromJsonMap(Map<String, dynamic> json) {
    carrera = json["carrera"];
    duracion = json["duracion"].toDouble();
    plan = json["plan"];
  }
}

class Ubicacion {
  double latitud;
  double longitud;

  Ubicacion({
    this.latitud,
    this.longitud,
  });

  Ubicacion.fromJsonMap(List<dynamic> json) {
    latitud = 2.1;
    longitud = 2.2;
  }
}

class Universidad {
  Superior superiores;
  Escuela escuela;
  Carrera carrera;
  Ubicacion ubicacion;

  Universidad({this.superiores, this.escuela, this.carrera, this.ubicacion});

  Universidad.fromJsonMap(Map<String, dynamic> json) {
    superiores = Superior.fromJsonMap(json['superiores']);
    escuela = Escuela.fromJsonMap(json['escuelas']);
  }
}
