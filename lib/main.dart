import 'package:flutter/material.dart';

import 'models/student.dart';
import 'models/tl.dart';
import 'models/padres.dart';

void main() {
  runApp(const MiAppNotas());
}

class MiAppNotas extends StatelessWidget {
  const MiAppNotas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestor de Calificaciones',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaNotas(),
    );
  }
}

class PantallaNotas extends StatefulWidget {
  const PantallaNotas({super.key});

  @override
  State<PantallaNotas> createState() => _PantallaNotasState();
}

class _PantallaNotasState extends State<PantallaNotas> {
  // Datos iniciales de prueba
  final Student _estudiante = Student(name: 'Rony', year: 20)
    ..mutliRates([5.0, 5.0, 5.0]);

  final TL _profesor = TL(name: 'marcos', year: 30);

  final Padres _padres = Padres(name: 'andres', year: 20);

  String _resultadoEvaluacion = '';

  void _evaluarEstudiante() {
    setState(() {
      double promedio = _estudiante.promedie;
      String mensaje = _padres.paloterapia(_estudiante);

      _profesor.verCalificacion(_estudiante);

      _resultadoEvaluacion =
          'Promedio: ${promedio.toStringAsFixed(1)}\n\nEn casa: $mensaje';
    });
  }

  @override
  Widget build(BuildContext context) {
    double promedio = _estudiante.promedie;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Calificaciones'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.person, size: 40),
                title: Text(
                  _estudiante.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Edad: ${_estudiante.year} años'),
                trailing: Chip(
                  label: Text('Promedio: ${promedio.toStringAsFixed(1)}'),
                  backgroundColor: promedio >= 3.0
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _evaluarEstudiante,
              icon: const Icon(Icons.analytics),
              label: const Text('Evaluar con Profesor y Padres'),
            ),

            const SizedBox(height: 20),

            if (_resultadoEvaluacion.isNotEmpty)
              Card(
                color: Colors.deepPurple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _resultadoEvaluacion,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
