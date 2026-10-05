// Ponto de entrada do app Caderno de Campo do Vale.
// Este arquivo monta o MaterialApp com o tema institucional do IF Goiano
// e direciona a execução para a tela principal do checklist.

import 'package:flutter/material.dart';

import 'telas/tela_checklist.dart';

void main() => runApp(const ChecklistApp());

class ChecklistApp extends StatelessWidget {
  const ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderno de Campo do Vale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E5631)),
        useMaterial3: true,
      ),
      home: const TelaChecklist(),
    );
  }
}
