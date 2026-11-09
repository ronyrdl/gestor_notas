import 'person.dart';

class Student extends Person {
  final List<double> _califications = [];

  Student({required super.name, required super.year});
  List<double> get calificacions {
    return _califications;
  }

  void addRate(double rate) {
    if (rate < 1.0 || rate > 5.0) {
      throw ArgumentError("tu calificacion no puede ser menor a 1 o mayor a 5");
    } else {
      print("la calificacion a sido registrada");
    }
    _califications.add(rate);
  }

  void mutliRates(List<double> rates) {
    for (double rate in rates) {
      addRate(rate);
    }
  }

  double get promedie {
    if (_califications.isEmpty) return 0.0;
    double suma = 0.0;
    for (double nota in _califications) {
      suma += nota;
    }
    return suma / _califications.length;
  }
}
