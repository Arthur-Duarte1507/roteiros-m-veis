import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tbl02_moveis_trabalho_final/main.dart';

void main() {
  testWidgets('Botao dispara animacoes da atividade final', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TrabalhoFinalApp());

    final Size tamanhoInicial = tester.getSize(find.byType(AnimatedContainer));
    final AnimatedContainer containerInicial = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    final AnimatedOpacity opacityInicial = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );

    expect(tamanhoInicial.width, 150);
    expect(tamanhoInicial.height, 150);
    expect((containerInicial.decoration! as BoxDecoration).color, Colors.blue);
    expect(opacityInicial.opacity, 0);

    await tester.tap(find.text('Animar'));
    await tester.pumpAndSettle();

    final Size tamanhoAnimado = tester.getSize(find.byType(AnimatedContainer));
    final AnimatedContainer containerAnimado = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    final AnimatedOpacity opacityAnimada = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );

    expect(tamanhoAnimado.width, 240);
    expect(tamanhoAnimado.height, 240);
    expect((containerAnimado.decoration! as BoxDecoration).color, Colors.green);
    expect(opacityAnimada.opacity, 1);
  });
}
