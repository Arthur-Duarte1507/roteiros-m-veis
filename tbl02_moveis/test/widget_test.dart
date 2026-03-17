import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tbl02_moveis/main.dart';

void main() {
  testWidgets('Renderiza os quatro exercicios de animacao',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Tbl02MoveisApp());

    expect(find.text('Exercicio 1'), findsOneWidget);
    expect(find.text('Exercicio 2'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -900));
    await tester.pumpAndSettle();

    expect(find.text('Exercicio 3'), findsOneWidget);
    expect(find.text('Exercicio 4'), findsOneWidget);
  });
}
