import 'person.dart';
import 'student.dart';

class Padres extends Person {
  Padres({required super.name, required super.year});

  String paloterapia(Student estudiante) {
    if (estudiante.promedie < 3.0) {
      return "preparate ${estudiante.name} que llevas palo tu nota esta debajo de 3";
    } else {
      return "has pasado felicidadess ${estudiante.name}";
    }
  }
}
