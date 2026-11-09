import 'person.dart';
import 'student.dart';

class TL extends Person {
  TL({required super.name, required super.year});

  void llamarLaAtencion(String gender) {
    final msg = gender == "M" ? "Papa lindo" : "Mama linda";
    print("Presta atencion $msg!");
  }

  void calificar(Student estudiante, double rate) {
    estudiante.addRate(rate);
  }

  void verCalificacion(Student estudiante) {
    print(estudiante.calificacions);
  }

  void calificaVarias(Student estudiante, List<double> rates) {
    estudiante.mutliRates(rates);
  }
}
