// Widget: faixa de percentual.
// Mostra "X% concluído". Recebe o percentual já calculado pela tela
// (quem calcula é o PASSO 1, em tela_checklist.dart) — este arquivo só
// desenha o valor que recebe.

import 'package:flutter/material.dart';

class PercentualConcluido extends StatelessWidget {
  final double percentual;

  const PercentualConcluido({super.key, required this.percentual});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFD5F5E3),
      child: Text(
        '${percentual.toStringAsFixed(0)}% concluído',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E5631),
        ),
      ),
    );
  }
}
