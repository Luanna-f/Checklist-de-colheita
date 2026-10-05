// A linha inteira é tocável e tem altura mínima de 64, para facilitar o uso com luva.
// O contraste e o ícone diferenciam os estados sem depender apenas da cor.
// Concluído usa fundo #1E5631, texto branco riscado e check; pendente usa fundo branco,
// texto escuro e círculo vazio. O texto tem fonte 18 e o ícone, tamanho 32.

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
