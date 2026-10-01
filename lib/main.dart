// Checklist de Colheita — ponto de entrada do app
// Funcionalidade G do Caderno de Campo do Vale
// Programação para Dispositivos Móveis · IF Goiano — Campus Ceres
//
// Este arquivo agora só monta o app (tema, cor institucional) e aponta
// para a tela principal. A lógica do checklist mora em
// lib/telas/tela_checklist.dart, e os widgets visuais ficam em
// lib/widgets/. Para mexer numa parte específica, edite o arquivo dela;
// não é preciso tocar neste main.dart para acrescentar coisas na tela.
//
// COMO RODAR (uma vez, no terminal, dentro desta pasta):
//   flutter pub get
//   flutter run

import 'package:flutter/material.dart';

import 'telas/tela_checklist.dart';

void main() => runApp(const ChecklistApp());

class ChecklistApp extends StatelessWidget {
  const ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist de Colheita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E5631)),
        useMaterial3: true,
      ),
      home: const TelaChecklist(),
    );
  }
}
