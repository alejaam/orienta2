import 'package:flutter/material.dart';
import 'package:orientat/src/pages/resultado_page.dart';

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
        '1. Diseñar programas de computación y explorar nuevas aplicaciones tecnológicas para uso del internet.'),
    Question('2. Criar, cuidar y tratar animales domésticos y de campo'),
    Question(
        '3. Investigar sobre áreas verdes, medio ambiente y cambios climáticos'),
    Question('4. Ilustrar, dibujar y animar digitalmente.'),
    Question(
        '5. Seleccionar, capacitar y motivar al personal de una organización/empresa'),
    Question('6. Realizar excavaciones para descubrir restos del pasado'),
    Question('7. Resolver problemas de cálculo para construir un puente.'),
    Question(
        '8. Diseñar cursos para enseñar a la gente sobre temas de salud e higiene'),
    Question('9. Tocar un instrumento y componer música'),
    Question(
        '10. Planificar cuáles son las metas de una organización pública o privada a mediano y largo plazo.'),
    Question(
        '11. Diseñar y planificar la producción masiva de artículos como muebles, autos, equipos de oficina, empaques y envases para alimentos y otros.'),
    Question('12. Diseñar logotipos y portadas de una revista'),
    Question('13. Organizar eventos y atender a sus asistentes.'),
    Question('14. Atender la salud de personas enfermas.'),
    Question(
        '15. Controlar ingresos y egresos de fondos y presentar el balance final de una institución..'),
    Question('16. Hacer experimentos con plantas (frutas, árboles, flores) '),
    Question('17. Concebir planos para viviendas, edificios y ciudadelas.'),
    Question('18. Investigar y probar nuevos productos farmacéuticos.'),
    Question(
        '19. Hacer propuestas y formular estrategias para aprovechar las relaciones económicas entre dos países.'),
    Question(
        '20. Pintar, hacer esculturas, ilustrar libros de arte, etcétera.'),
    Question(
        '21. Elaborar campañas para introducir un nuevo producto al mercado.'),
    Question('22. Examinar y tratar los problemas visuales'),
    Question(
        '23. Defender a clientes individuales o empresas en juicios de diferente naturaleza.'),
    Question('24. Diseñar máquinas que puedan simular actividades humanas.'),
    Question(
        '25. Investigar las causas y efectos de los trastornos emocionales'),
    Question('26. Supervisar las ventas de un centro comercial'),
    Question(
        '27. Atender y realizar ejercicios a personas que tienen limitaciones físicas, problemas de lenguaje, etcétera.'),
    Question('28. Prepararse para ser modelo profesional.'),
    Question(
        '29. Aconsejar a las personas sobre planes de ahorro e inversiones.'),
    Question(
        '30. Elaborar mapas, planos e imágenes para el estudio y análisis de datos geográficos.'),
    Question('31. Diseñar juegos interactivos electrónicos para computadora.'),
    Question('32. Realizar el control de calidad de los alimentos'),
    Question('33. Tener un negocio propio de tipo comercial.'),
    Question('34. Escribir artículos periodísticos, cuentos, novelas y otros.'),
    Question('35. Redactar guiones y libretos para un programa de televisión'),
    Question(
        '36. Organizar un plan de distribución y venta de un gran almacén.'),
    Question('37.Estudiar la diversidad cultural en el ámbito rural y urbano'),
    Question(
        '38. Gestionar y evaluar convenios internacionales de cooperación para el desarrollo social.'),
    Question('39. Crear campañas publicitarias'),
    Question(
        '40. Trabajar investigando la reproducción de peces, camarones y otros animales marinos.'),
    Question(
        '41. Dedicarse a fabricar productos alimenticios de consumo masivo'),
    Question(
        '42. Gestionar y evaluar proyectos de desarrollo en una institución educativa y/o fundación.'),
    Question(
        '43. Rediseñar y decorar espacios físicos en viviendas, oficinas y locales comerciales.'),
    Question('44.Administrar una empresa de turismo y/o agencias de viaje.'),
    Question(
        '45. Aplicar métodos alternativos a la medicina tradicional para atender personas con dolencias de diversa índole.'),
    Question('46.Diseñar ropa para niños, jóvenes y adultos.'),
    Question('47.Investigar organismos vivos para elaborar vacunas.'),
    Question(
        '48. Manejar y/o dar mantenimiento a dispositivos/aparatos tecnológicos en aviones, barcos, radares, etcétera.'),
    Question(
        '49. Estudiar idiomas extranjeros –actuales y antiguos- para hacer traducción.'),
    Question('50.Restaurar piezas y obras de arte'),
    Question(
        '51. Revisar y dar mantenimiento a artefactos eléctricos, electrónicos y computadoras.'),
    Question('52. Enseñar a niños de 0 a 5 años'),
    Question('53. Investigar y/o sondear nuevos mercados.'),
    Question('54. Atender la salud dental de las personas'),
    Question(
        '55. Tratar a niños, jóvenes y adultos con problemas psicológicos.'),
    Question(
        '56. Crear estrategias de promoción y venta de nuevos productos ecuatorianos en el mercado internacional.'),
    Question(
        '57. Planificar y recomendar dietas para personas diabéticas y/o con sobrepeso.'),
    Question(
        '58. Trabajar en una empresa petrolera en un cargo técnico como control de la producción.'),
    Question('59. Administrar una empresa (familiar, privada o pública)'),
    Question(
        '60. Tener un taller de reparación y mantenimiento de carros, tractores, etcétera.'),
    Question('61. Ejecutar proyectos de extracción minera y metalúrgica.'),
    Question(
        '62. Asistir a directivos de multinacionales con manejo de varios idiomas.'),
    Question('63. Diseñar programas educativos para niños con discapacidad.'),
    Question(
        '64. Aplicar conocimientos de estadística en investigaciones en diversas áreas (social, administrativa, salud, etcétera.)'),
    Question(
        '65. Fotografiar hechos históricos, lugares significativos, rostros, paisajes para el área publicitaria, artística, periodística y social'),
    Question(
        '66. Trabajar en museos y bibliotecas nacionales e internacionales.'),
    Question('67. Ser parte de un grupo de teatro.'),
    Question(
        '68. Producir cortometrajes, spots publicitarios, programas educativos, de ficción, etcétera.'),
    Question(
        '69. Estudiar la influencia entre las corrientes marinas y el clima y sus consecuencias ecológicas.'),
    Question(
        '70. Conocer las distintas religiones, su filosofía y transmitirlas a la comunidad en general'),
    Question(
        '71. Asesorar a inversionistas en la compra de bienes/acciones en mercados nacionales e internacionales.'),
    Question(
        '72. Estudiar grupos étnicos, sus costumbres , tradiciones, cultura y compartir sus vivencias.'),
    Question(
        '73. Explorar el espacio sideral, los planetas , características y componentes.'),
    Question(
        '74. Mejorar la imagen facial y corporal de las personas aplicando diferentes técnicas.'),
    Question('75.Decorar jardines de casas y parques públicos.'),
    Question(
        '76. Administrar y renovar menúes de comidas en un hotel o restaurante.'),
    Question(
        '77. Trabajar como presentador de televisión, locutor de radio y televisión, animador de programas culturales y concursos.'),
    Question('78.Diseñar y ejecutar programas de turismo.'),
    Question(
        '79. Administrar y ordenar (planificar) adecuadamente la ocupación del espacio físico de ciudades, países etc., utilizando imágenes de satélite, mapas.'),
    Question('80. Organizar, planificar y administrar centros educativos'),
  ];

  void nextQuestion(context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      String resultado = this.getResult();
      _questionNumber = 0;
      area1 = 0;
      area2 = 0;
      area3 = 0;
      area4 = 0;
      area5 = 0;
      final route = new MaterialPageRoute(builder: (context) {
        return ResultadoPage(text: resultado);
      });
      Navigator.of(context).pushReplacement(route);
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

  String getResult(){
    var lista = new List();
    var mayor;
    // lista..add(area1)..add(area2)..add(area3)..add(area4)..add(area5);
    // lista.forEach((item) => {
    //   mayor = (item > mayor)? item : mayor
    // }
    // );
    // lista.sort();
    // print(lista);
    if(area1 >= area2 && area1 >= area3 && area1 >= area4 && area1 >= area5){
      mayor = "Felicidades, tienes aptitudes para entrar al área 1";
    }else if(area2 >= area1 && area2 >= area3 && area2 >= area4 && area2 >= area5){
      mayor = "Felicidades, tienes aptitudes para entrar al área 2";
    }else if(area3 >= area1 && area3 >= area2 && area3 >= area4 && area3 >= area5){
      mayor = "Felicidades, tienes aptitudes para entrar al área 3";
    }else if(area4 >= area1 && area4 >= area2 && area4 >= area3 && area4 >= area5){
      mayor = "Felicidades, tienes aptitudes para entrar al área 4";
    }else if(area5 >= area1 && area5 >= area2 && area5 >= area3 && area5 >= area4){
      mayor = "Felicidades, tienes aptitudes para entrar al área 5";
    }
    return mayor;
  }

  //se viene un desmadre para poder dar resultado  AREA1
  void validararea() {
    switch (_questionNumber) {
      case 4:
      case 9:
      case 12:
      case 20:
      case 28:
      case 31:
      case 35:
      case 39:
      case 43:
      case 46:
      case 50:
      case 65:
      case 67:
      case 68:
      case 75:
      case 77:
        area1++;
        break;
      case 6:
      case 13:
      case 23:
      case 25:
      case 34:
      case 37:
      case 38:
      case 42:
      case 49:
      case 52:
      case 55:
      case 63:
      case 66:
      case 70:
      case 72:
      case 78:
        area2++;
        break;
      case 5:
      case 10:
      case 15:
      case 19:
      case 21:
      case 26:
      case 29:
      case 33:
      case 36:
      case 44:
      case 53:
      case 56:
      case 59:
      case 62:
      case 71:
      case 80:
        area3++;
        break;
      case 1:
      case 7:
      case 11:
      case 17:
      case 18:
      case 24:
      case 30:
      case 41:
      case 48:
      case 51:
      case 58:
      case 60:
      case 61:
      case 64:
      case 73:
      case 79:
        area4++;
        break;
      case 2:
      case 3:
      case 8:
      case 14:
      case 16:
      case 22:
      case 27:
      case 32:
      case 40:
      case 45:
      case 47:
      case 54:
      case 57:
      case 69:
      case 74:
      case 76:
        area5++;
        break;

      default:
    }
  }
}
