import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:caderno_campo/main.dart';

void main() {
  testWidgets('app inicia com título, percentual inicial e aba Todos',
      (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    expect(find.text('Checklist de colheita'), findsOneWidget);
    expect(find.text('0% concluído'), findsOneWidget);
    expect(find.text('Todos'), findsOneWidget);
  });

  testWidgets('campo vazio mostra a mensagem de validação', (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    await tester.tap(find.text('Adicionar'));
    await tester.pump();

    expect(find.text('Digite uma tarefa antes de adicionar.'), findsOneWidget);
  });

  testWidgets('adicionar um item válido inclui o texto na lista e limpa o campo',
      (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    const texto = 'Colher uma amostra de soja';
    await tester.enterText(find.byType(TextField), texto);
    await tester.pump();

    await tester.tap(find.text('Adicionar'));
    await tester.pump();
    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pump();

    expect(find.text(texto), findsOneWidget);
    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text,
        isEmpty);
  });

  testWidgets('tocar em um item altera o percentual', (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    const texto = 'Regular a plataforma de corte da colheitadeira para a soja';
    await tester.tap(find.text(texto));
    await tester.pump();

    expect(find.text('14% concluído'), findsOneWidget);
  });

  testWidgets(
      'estando na aba Concluídos, adicionar um item volta para a aba Todos e o novo item aparece',
      (tester) async {
    await tester.pumpWidget(const ChecklistApp());

    await tester.tap(find.text('Concluídos'));
    await tester.pump();

    const texto = 'Verificar o silo de armazenamento';
    await tester.enterText(find.byType(TextField), texto);
    await tester.pump();

    await tester.tap(find.text('Adicionar'));
    await tester.pump();
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.widgetWithText(FilledButton, 'Todos'), findsOneWidget);
    expect(find.text(texto), findsOneWidget);
  });
}
