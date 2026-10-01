// Widget: barra de abas fingida (Todos / A fazer / Concluídos).
// Três botões lado a lado. O botão da aba atual fica preenchido
// (FilledButton); os outros ficam só com borda (OutlinedButton).
// Ao tocar, chama aoSelecionar com o número da aba escolhida — quem
// decide o que fazer com isso é a tela (tela_checklist.dart), não este
// widget.

import 'package:flutter/material.dart';

class BarraDeFiltros extends StatelessWidget {
  final int abaSelecionada;
  final ValueChanged<int> aoSelecionar;

  const BarraDeFiltros({
    super.key,
    required this.abaSelecionada,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          Expanded(child: _botaoAba(0, 'Todos')),
          const SizedBox(width: 8),
          Expanded(child: _botaoAba(1, 'A fazer')),
          const SizedBox(width: 8),
          Expanded(child: _botaoAba(2, 'Concluídos')),
        ],
      ),
    );
  }

  // Monta o botão de uma aba, já com o visual de selecionado/não
  // selecionado.
  Widget _botaoAba(int aba, String rotulo) {
    final selecionada = aba == abaSelecionada;

    if (selecionada) {
      return FilledButton(
        onPressed: () => aoSelecionar(aba),
        style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1E5631)),
        child: Text(rotulo),
      );
    }

    return OutlinedButton(
      onPressed: () => aoSelecionar(aba),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF1E5631),
        side: const BorderSide(color: Color(0xFF1E5631)),
      ),
      child: Text(rotulo),
    );
  }
}
