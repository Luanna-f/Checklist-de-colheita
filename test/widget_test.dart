import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:caderno_campo/main.dart';

void main() {
  testWidgets('app inicializa com a tela do checklist', (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    expect(find.text('Checklist de colheita'), findsOneWidget);
    expect(find.text('0% concluído'), findsOneWidget);
    expect(find.text('Todos'), findsOneWidget);
  });

  testWidgets('valida campo vazio e limpa o texto após adicionar',
      (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    await tester.tap(find.text('Adicionar'));
    await tester.pump();

    expect(find.text('Digite uma tarefa antes de adicionar.'), findsOneWidget);

    final campo = tester.widget<TextField>(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'Colher uma amostra de soja');
    await tester.pump();

    expect(campo.controller?.text, 'Colher uma amostra de soja');

    await tester.tap(find.text('Adicionar'));
    await tester.pump();

    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, isEmpty);
  });
}
