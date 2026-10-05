// Barra de filtros com as abas Todos, A fazer e Concluídos.
// O estado da aba fica em tela_checklist.dart e este widget apenas renderiza a seleção.

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

  // Monta o botão de uma aba com o visual de selecionado ou não.
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
