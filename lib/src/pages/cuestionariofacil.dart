class Question {
  String question;
  bool answer;

  Question(String q) {
    question = q;
  }
}

class CuestionarioFacil {
  int _questionNumber = 0;
  int area1 = 0;
  int area2 = 0;
  int area3 = 0;
  int area4 = 0;
  int area5 = 0;

  bool respuestausuario = false;

  List<Question> _questionBank = [
    Question(
        '1.Diseñar programas de computación y explorar nuevas aplicaciones tecnológicas para uso del internet.'),
    Question('2.Criar, cuidar y tratar animales domésticos y de campo'),
    Question(
        '3.Investigar sobre áreas verdes, medio ambiente y cambios climáticos'),
    Question('4.Ilustrar, dibujar y animar digitalmente.'),
    Question(
        '5.Seleccionar, capacitar y motivar al personal de una organización/empresa'),
    Question('6.Realizar excavaciones para descubrir restos del pasado'),
    Question('7.Resolver problemas de cálculo para construir un puente.'),
    Question(
        '8.Diseñar cursos para enseñar a la gente sobre temas de salud e higiene'),
    Question('9.Tocar un instrumento y componer música'),
    Question(
        '10.Planificar cuáles son las metas de una organización pública o privada a mediano y largo plazo.'),
    Question(
        '11.Diseñar y planificar la producción masiva de artículos como muebles, autos, equipos de oficina, empaques y envases para alimentos y otros.'),
    Question('12.Diseñar logotipos y portadas de una revista'),
    Question('13.Organizar eventos y atender a sus asistentes.'),
    Question('14.Atender la salud de personas enfermas.'),
    Question(
        '15.Controlar ingresos y egresos de fondos y presentar el balance final de una institución..'),
    Question('16.Hacer experimentos con plantas (frutas, árboles, flores) '),
    Question('17.Concebir planos para viviendas, edificios y ciudadelas.'),
    Question('18.Investigar y probar nuevos productos farmacéuticos.'),
    Question(
        '19.Hacer propuestas y formular estrategias para aprovechar las relaciones económicas entre dos países.'),
    Question('20.Pintar, hacer esculturas, ilustrar libros de arte, etcétera.'),
    Question(
        '21.Elaborar campañas para introducir un nuevo producto al mercado.'),
    Question('22.Examinar y tratar los problemas visuales'),
    Question(
        '23.Defender a clientes individuales o empresas en juicios de diferente naturaleza.'),
    Question('24.Diseñar máquinas que puedan simular actividades humanas.'),
    Question(
        '25.Investigar las causas y efectos de los trastornos emocionales'),
    Question('26.Supervisar las ventas de un centro comercial'),
    Question(
        '27.Atender y realizar ejercicios a personas que tienen limitaciones físicas, problemas de lenguaje, etcétera.'),
    Question('28.Prepararse para ser modelo profesional.'),
    Question(
        '29.Aconsejar a las personas sobre planes de ahorro e inversiones.'),
    Question(
        '30.Elaborar mapas, planos e imágenes para el estudio y análisis de datos geográficos.'),
    Question('31.Diseñar juegos interactivos electrónicos para computadora.'),
    Question('32.Realizar el control de calidad de los alimentos'),
    Question('33.Tener un negocio propio de tipo comercial.'),
    Question('34.Escribir artículos periodísticos, cuentos, novelas y otros.'),
    Question('35.Redactar guiones y libretos para un programa de televisión'),
    Question(
        '36.Organizar un plan de distribución y venta de un gran almacén.'),
    Question('37.Estudiar la diversidad cultural en el ámbito rural y urbano'),
    Question(
        '38.Gestionar y evaluar convenios internacionales de cooperación para el desarrollo social.'),
    Question('39.Crear campañas publicitarias'),
    Question(
        '40.Trabajar investigando la reproducción de peces, camarones y otros animales marinos.'),
    Question(
        '41.Dedicarse a fabricar productos alimenticios de consumo masivo'),
    Question(
        '42.Gestionar y evaluar proyectos de desarrollo en una institución educativa y/o fundación.'),
    Question(
        '43.Rediseñar y decorar espacios físicos en viviendas, oficinas y locales comerciales.'),
    Question('44.Administrar una empresa de turismo y/o agencias de viaje.'),
    Question(
        '45.Aplicar métodos alternativos a la medicina tradicional para atender personas con dolencias de diversa índole.'),
    Question('46.Diseñar ropa para niños, jóvenes y adultos.'),
    Question('47.Investigar organismos vivos para elaborar vacunas.'),
    Question(
        '48.Manejar y/o dar mantenimiento a dispositivos/aparatos tecnológicos en aviones, barcos, radares, etcétera.'),
    Question(
        '49.Estudiar idiomas extranjeros –actuales y antiguos- para hacer traducción.'),
    Question('50.Restaurar piezas y obras de arte'),
    Question(
        '51.Revisar y dar mantenimiento a artefactos eléctricos, electrónicos y computadoras.'),
    Question('52.Enseñar a niños de 0 a 5 años'),
    Question('53.Investigar y/o sondear nuevos mercados.'),
    Question('54.Atender la salud dental de las personas'),
    Question(
        '55.Tratar a niños, jóvenes y adultos con problemas psicológicos.'),
    Question(
        '56.Crear estrategias de promoción y venta de nuevos productos ecuatorianos en el mercado internacional.'),
    Question(
        '57. Planificar y recomendar dietas para personas diabéticas y/o con sobrepeso.'),
    Question(
        '58.Trabajar en una empresa petrolera en un cargo técnico como control de la producción.'),
    Question('59.Administrar una empresa (familiar, privada o pública)'),
    Question(
        '60.Tener un taller de reparación y mantenimiento de carros, tractores, etcétera.'),
    Question('61.Ejecutar proyectos de extracción minera y metalúrgica.'),
    Question(
        '62.Asistir a directivos de multinacionales con manejo de varios idiomas.'),
    Question('63.Diseñar programas educativos para niños con discapacidad.'),
    Question(
        '64.Aplicar conocimientos de estadística en investigaciones en diversas áreas (social, administrativa, salud, etcétera.)'),
    Question(
        '65.Fotografiar hechos históricos, lugares significativos, rostros, paisajes para el área publicitaria, artística, periodística y social'),
    Question(
        '66.Trabajar en museos y bibliotecas nacionales e internacionales.'),
    Question('67.Ser parte de un grupo de teatro.'),
    Question(
        '68.Producir cortometrajes, spots publicitarios, programas educativos, de ficción, etcétera.'),
    Question(
        '69.Estudiar la influencia entre las corrientes marinas y el clima y sus consecuencias ecológicas.'),
    Question(
        '70.Conocer las distintas religiones, su filosofía y transmitirlas a la comunidad en general'),
    Question(
        '71.Asesorar a inversionistas en la compra de bienes/acciones en mercados nacionales e internacionales.'),
    Question(
        '72.Estudiar grupos étnicos, sus costumbres , tradiciones, cultura y compartir sus vivencias.'),
    Question(
        '73.Explorar el espacio sideral, los planetas , características y componentes.'),
    Question(
        '74.Mejorar la imagen facial y corporal de las personas aplicando diferentes técnicas.'),
    Question('75.Decorar jardines de casas y parques públicos.'),
    Question(
        '76.Administrar y renovar menúes de comidas en un hotel o restaurante.'),
    Question(
        '77.Trabajar como presentador de televisión, locutor de radio y televisión, animador de programas culturales y concursos.'),
    Question('78.Diseñar y ejecutar programas de turismo.'),
    Question(
        '79.Administrar y ordenar (planificar) adecuadamente la ocupación del espacio físico de ciudades, países etc., utilizando imágenes de satélite, mapas.'),
    Question('80.Organizar, planificar y administrar centros educativos'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return null;
  }

  void printQuestion() {
    _questionBank.forEach((i) {
      print(i.question);
    });
  }

  //se viene un desmadre para poder dar resultado  AREA1
  void validararea1() {
    if (_questionNumber == 4 && respuestausuario == true) {
      area1++;

      if (_questionNumber == 9 && respuestausuario == true) {
        area1++;

        if (_questionNumber == 12 && respuestausuario == true) {
          area1++;

          if (_questionNumber == 20 && respuestausuario == true) {
            area1++;

            if (_questionNumber == 28 && respuestausuario == true) {
              area1++;

              if (_questionNumber == 31 && respuestausuario == true) {
                area1++;

                if (_questionNumber == 35 && respuestausuario == true) {
                  area1++;

                  if (_questionNumber == 39 && respuestausuario == true) {
                    area1++;

                    if (_questionNumber == 43 && respuestausuario == true) {
                      area1++;

                      if (_questionNumber == 46 && respuestausuario == true) {
                        area1++;

                        if (_questionNumber == 50 && respuestausuario == true) {
                          area1++;

                          if (_questionNumber == 65 &&
                              respuestausuario == true) {
                            area1++;

                            if (_questionNumber == 67 &&
                                respuestausuario == true) {
                              area1++;

                              if (_questionNumber == 68 &&
                                  respuestausuario == true) {
                                area1++;

                                if (_questionNumber == 75 &&
                                    respuestausuario == true) {
                                  area1++;

                                  if (_questionNumber == 77 &&
                                      respuestausuario == true) {
                                    area1++;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } //aqui termina ifs anidados (FIN AREA 1)

  //INICIO AREA2
  void validararea2() {
    if (_questionNumber == 6 && respuestausuario == true) {
      area2++;

      if (_questionNumber == 13 && respuestausuario == true) {
        area1++;

        if (_questionNumber == 23 && respuestausuario == true) {
          area2++;

          if (_questionNumber == 25 && respuestausuario == true) {
            area2++;

            if (_questionNumber == 34 && respuestausuario == true) {
              area2++;

              if (_questionNumber == 37 && respuestausuario == true) {
                area2++;

                if (_questionNumber == 38 && respuestausuario == true) {
                  area2++;

                  if (_questionNumber == 42 && respuestausuario == true) {
                    area2++;

                    if (_questionNumber == 49 && respuestausuario == true) {
                      area2++;

                      if (_questionNumber == 52 && respuestausuario == true) {
                        area2++;

                        if (_questionNumber == 55 && respuestausuario == true) {
                          area2++;

                          if (_questionNumber == 63 &&
                              respuestausuario == true) {
                            area2++;

                            if (_questionNumber == 66 &&
                                respuestausuario == true) {
                              area2++;

                              if (_questionNumber == 70 &&
                                  respuestausuario == true) {
                                area2++;

                                if (_questionNumber == 72 &&
                                    respuestausuario == true) {
                                  area2++;

                                  if (_questionNumber == 78 &&
                                      respuestausuario == true) {
                                    area2++;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } //aqui termina ifs anidados (FIN AREA2)

  //INICIO AREA3
  void validararea3() {
    if (_questionNumber == 5 && respuestausuario == true) {
      area3++;

      if (_questionNumber == 10 && respuestausuario == true) {
        area3++;

        if (_questionNumber == 15 && respuestausuario == true) {
          area3++;

          if (_questionNumber == 19 && respuestausuario == true) {
            area3++;

            if (_questionNumber == 21 && respuestausuario == true) {
              area3++;

              if (_questionNumber == 26 && respuestausuario == true) {
                area3++;

                if (_questionNumber == 29 && respuestausuario == true) {
                  area3++;

                  if (_questionNumber == 33 && respuestausuario == true) {
                    area3++;

                    if (_questionNumber == 36 && respuestausuario == true) {
                      area3++;

                      if (_questionNumber == 44 && respuestausuario == true) {
                        area3++;

                        if (_questionNumber == 53 && respuestausuario == true) {
                          area3++;

                          if (_questionNumber == 56 &&
                              respuestausuario == true) {
                            area3++;

                            if (_questionNumber == 59 &&
                                respuestausuario == true) {
                              area3++;

                              if (_questionNumber == 62 &&
                                  respuestausuario == true) {
                                area3++;

                                if (_questionNumber == 71 &&
                                    respuestausuario == true) {
                                  area3++;

                                  if (_questionNumber == 80 &&
                                      respuestausuario == true) {
                                    area3++;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } //aqui termina ifs anidados (FIN AREA 3)

  //INICIO AREA4
  void validararea4() {
    if (_questionNumber == 1 && respuestausuario == true) {
      area4++;

      if (_questionNumber == 7 && respuestausuario == true) {
        area4++;

        if (_questionNumber == 11 && respuestausuario == true) {
          area4++;

          if (_questionNumber == 17 && respuestausuario == true) {
            area4++;

            if (_questionNumber == 18 && respuestausuario == true) {
              area4++;

              if (_questionNumber == 24 && respuestausuario == true) {
                area4++;

                if (_questionNumber == 30 && respuestausuario == true) {
                  area4++;

                  if (_questionNumber == 41 && respuestausuario == true) {
                    area4++;

                    if (_questionNumber == 48 && respuestausuario == true) {
                      area4++;

                      if (_questionNumber == 51 && respuestausuario == true) {
                        area4++;

                        if (_questionNumber == 58 && respuestausuario == true) {
                          area4++;

                          if (_questionNumber == 60 &&
                              respuestausuario == true) {
                            area4++;

                            if (_questionNumber == 61 &&
                                respuestausuario == true) {
                              area4++;

                              if (_questionNumber == 64 &&
                                  respuestausuario == true) {
                                area4++;

                                if (_questionNumber == 73 &&
                                    respuestausuario == true) {
                                  area4++;

                                  if (_questionNumber == 79 &&
                                      respuestausuario == true) {
                                    area4++;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } //aqui termina ifs anidados (FIN AREA 4 )

  //INICIO AREA 5
  void validararea5() {
    if (_questionNumber == 2 && respuestausuario == true) {
      area5++;

      if (_questionNumber == 3 && respuestausuario == true) {
        area5++;

        if (_questionNumber == 8 && respuestausuario == true) {
          area5++;

          if (_questionNumber == 14 && respuestausuario == true) {
            area5++;

            if (_questionNumber == 16 && respuestausuario == true) {
              area5++;

              if (_questionNumber == 22 && respuestausuario == true) {
                area5++;

                if (_questionNumber == 27 && respuestausuario == true) {
                  area5++;

                  if (_questionNumber == 32 && respuestausuario == true) {
                    area5++;

                    if (_questionNumber == 40 && respuestausuario == true) {
                      area5++;

                      if (_questionNumber == 45 && respuestausuario == true) {
                        area5++;

                        if (_questionNumber == 47 && respuestausuario == true) {
                          area5++;

                          if (_questionNumber == 54 &&
                              respuestausuario == true) {
                            area5++;

                            if (_questionNumber == 57 &&
                                respuestausuario == true) {
                              area5++;

                              if (_questionNumber == 69 &&
                                  respuestausuario == true) {
                                area5++;

                                if (_questionNumber == 74 &&
                                    respuestausuario == true) {
                                  area5++;

                                  if (_questionNumber == 76 &&
                                      respuestausuario == true) {
                                    area5++;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } //aqui termina ifs anidados FIN AREA 5

}
