import 'package:flutter_test/flutter_test.dart';

import 'package:gestor_notas/main.dart';

void main() {
  testWidgets('Muestra la información del estudiante', (tester) async {
    await tester.pumpWidget(const MiAppNotas());

    expect(find.text('Gestor de Calificaciones'), findsOneWidget);
    expect(find.text('Rony'), findsOneWidget);
    expect(find.text('Edad: 20 años'), findsOneWidget);
    expect(find.text('Promedio: 2.0'), findsOneWidget);
  });

  testWidgets('Evalúa al estudiante con profesor y padres', (tester) async {
    await tester.pumpWidget(const MiAppNotas());

    await tester.tap(find.text('Evaluar con Profesor y Padres'));
    await tester.pump();

    expect(find.textContaining('En casa: preparate Rony'), findsOneWidget);
  });
}
