// Widget: visual de um item do checklist.
// Pensado para uso no campo, com luva e sol forte:
// - alvo de toque grande (altura mínima de 64 e linha inteira tocável);
// - contraste forte: concluído = fundo verde, texto branco e riscado;
//   pendente = fundo branco, borda verde e texto escuro.
// A lógica do toque NÃO está aqui: ela chega pelo parâmetro aoTocar,
// que a tela liga no PASSO 4 (e implementa no PASSO 2).

import 'package:flutter/material.dart';

class ItemChecklist extends StatelessWidget {
  final String texto;
  final bool concluido;
  final VoidCallback aoTocar;

  const ItemChecklist({
    super.key,
    required this.texto,
    required this.concluido,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final corFundo = concluido ? const Color(0xFF1E5631) : Colors.white;
    final corTexto = concluido ? Colors.white : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: aoTocar,
        child: Container(
          constraints: const BoxConstraints(minHeight: 64),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: corFundo,
            border: Border.all(color: const Color(0xFF1E5631), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                concluido ? Icons.check_circle : Icons.radio_button_unchecked,
                color: corTexto,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  texto,
                  style: TextStyle(
                    fontSize: 18,
                    color: corTexto,
                    decoration: concluido
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
