// Tela do Checklist de colheita.
// Toda a lógica do app mora aqui: as duas listas paralelas, o filtro
// de abas, o percentual e os quatro TODOs. Os widgets visuais vêm de
// lib/widgets/ e são só importados.
//
// IDEIA CENTRAL: DUAS LISTAS PARALELAS
// _itens[indice] guarda o texto da tarefa e _concluido[indice] guarda se
// ela já foi feita. As duas listas SEMPRE têm o mesmo tamanho e a mesma
// ordem: a posição 2 de uma corresponde à posição 2 da outra.

import 'package:flutter/material.dart';

import '../widgets/barra_de_filtros.dart';
import '../widgets/item_checklist.dart';
import '../widgets/percentual_concluido.dart';

class TelaChecklist extends StatefulWidget {
  const TelaChecklist({super.key});

  @override
}

class _TelaChecklistState extends State<TelaChecklist> {
  // Lista com o texto de cada tarefa. (JÁ PRONTO)
  final List<String> _itens = [
    'Regular a plataforma de corte da colheitadeira para a soja',
    'Conferir a umidade dos grãos de soja antes de iniciar a colheita',
    'Calibrar os sensores de perda de grãos na colheitadeira',
    'Vistoriar os talhões: tombamento, plantas daninhas e falhas de plantio',
    'Revisar a plataforma e as correntes para a colheita do milho',
    'Agendar caminhões para levar a produção até o armazém',
    'Limpar a caixa de grãos e a rosca de descarga antes de cada talhão',
  ];

  // Lista paralela: _concluido[indice] diz se _itens[indice] já foi
  // feito. Todas começam como false (pendente). (JÁ PRONTO)
  final List<bool> _concluido = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  // Controlador do campo "novo item", com dispose logo abaixo. (JÁ PRONTO)
  final _novoItemController = TextEditingController();

  // Mensagem de erro do campo. Nulo = sem erro. Usada no PASSO 3.
  // (JÁ PRONTO)
  String? _erro;

  // Qual aba está selecionada: 0 = Todos, 1 = A fazer, 2 = Concluídos.
  // "Fingimos" as abas com um número guardado no estado: o valor muda
  // ao tocar num botão (dentro de setState) e o build() usa esse valor
  // para decidir quais itens mostrar. (JÁ PRONTO)
  int _abaSelecionada = 0;

  @override
  void dispose() {
    _novoItemController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------------------
  // TODO PASSO 1 — Calcule o percentual concluído.
  // Percorra a lista _concluido contando quantos valores são true e
  // devolva (contagem / total) * 100 como double, de 0.0 a 100.0.
  //
  // CUIDADO: se a lista estiver vazia, o total é 0 e não se divide por
  // zero. Trate esse caso primeiro e devolva 0.0.
  //
  // Conceitos: for com índice, if, variável contadora, .length,
  // divisão entre int e double.
  //
  // double _calcularPercentual() {
  //   ...
  // }
  //
  // Por enquanto a função devolve 0.0 só para o app compilar.
  // -------------------------------------------------------------------
  double _calcularPercentual() {
    return 0.0;
  }

  // -------------------------------------------------------------------
  // TODO PASSO 2 — Alterne o item entre concluído e pendente.
  // Dentro de setState(), inverta o valor de _concluido[indice]:
  // se era true vira false, se era false vira true.
  // Esta função será chamada quando o produtor tocar no item
  // (a ligação é feita no PASSO 4).
  //
  // Conceitos: setState, acesso por índice, operador ! (negação).
  //
  // void _alternarItem(int indice) {
  //   setState(() { ... });
  // }
  // -------------------------------------------------------------------
  void _alternarItem(int indice) {}

  // -------------------------------------------------------------------
  // TODO PASSO 3 — Adicione um novo item.
  // 1. Leia o texto de _novoItemController.text (use trim() para
  //    ignorar espaços nas pontas).
  // 2. Se estiver vazio, atualize _erro DENTRO de setState() com uma
  //    mensagem clara, que diga ao produtor o que fazer, e saia da
  //    função com return.
  // 3. Se estiver preenchido, DENTRO de setState():
  //      - acrescente o texto em _itens;
  //      - acrescente false em _concluido (as duas listas crescem
  //        juntas, sempre!);
  //      - limpe o _erro (volte para null).
  // 4. Limpe o campo com _novoItemController.clear().
  //
  // Conceitos: TextEditingController, validação de entrada, if/return,
  // List.add, setState.
  //
  // void _adicionarItem() {
  //   ...
  // }
  // -------------------------------------------------------------------
  void _adicionarItem() {}

  // -------------------------------------------------------------------
  // Filtra os itens conforme a aba selecionada.  (JÁ PRONTO)
  // Em vez de devolver os textos direto, devolvemos os ÍNDICES
  // originais que passam no filtro. Assim, ao tocar num item filtrado,
  // ainda sabemos qual posição alterar em _itens e _concluido.
  // Conceitos: for com índice, if, List<int>.
  // -------------------------------------------------------------------
  List<int> _indicesFiltrados() {
    final indices = <int>[];
    for (int i = 0; i < _itens.length; i++) {
      if (_abaSelecionada == 0) {
        // Aba "Todos": mostra tudo.
        indices.add(i);
      } else if (_abaSelecionada == 1 && !_concluido[i]) {
        // Aba "A fazer": só os pendentes.
        indices.add(i);
      } else if (_abaSelecionada == 2 && _concluido[i]) {
        // Aba "Concluídos": só os já feitos.
        indices.add(i);
      }
    }
    return indices;
  }

  // =====================================================================
  // A interface  (JÁ PRONTO, exceto os PASSOS 1 a 3)
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    // O percentual vem da função do PASSO 1 e é recalculado a cada
    // setState(), porque o build roda de novo.
    final percentual = _calcularPercentual();

    // A lista de índices que passam no filtro da aba atual, recalculada
    // a cada build (ou seja, a cada setState). (JÁ PRONTO)
    final indicesFiltrados = _indicesFiltrados();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist de colheita'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          PercentualConcluido(percentual: percentual),

          // Campo e botão para adicionar item próprio. (JÁ PRONTO)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _novoItemController,
                    decoration: InputDecoration(
                      labelText: 'Novo item',
                      border: const OutlineInputBorder(),
                      errorText: _erro,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 56,
                  child: FilledButton(
                    onPressed: _adicionarItem,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF1E5631),
                    ),
                    child: const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ),

          // Barra de abas (Todos / A fazer / Concluídos). (JÁ PRONTO)
          // Não é um TabBar de verdade: são três botões que trocam
          // _abaSelecionada dentro de setState, no mesmo padrão dos
          // outros botões da tela.
          BarraDeFiltros(
            abaSelecionada: _abaSelecionada,
            aoSelecionar: (novaAba) {
              setState(() {
                _abaSelecionada = novaAba;
              });
            },
          ),

          // Lista de itens da aba atual. (JÁ PRONTO)
          // itemCount usa indicesFiltrados, não _itens, porque só
          // mostramos os itens que passam no filtro da aba selecionada.
          // "posicao" é a posição dentro da lista filtrada; o índice
          // original (o que interessa para _itens/_concluido/
          // _alternarItem) é indicesFiltrados[posicao].
          Expanded(
            child: indicesFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum item nesta aba.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : ListView.builder(
                    itemCount: indicesFiltrados.length,
                    itemBuilder: (context, posicao) {
                      final indiceOriginal = indicesFiltrados[posicao];
                      return ItemChecklist(
                        texto: _itens[indiceOriginal],
                        concluido: _concluido[indiceOriginal],
                        aoTocar: () => _alternarItem(indiceOriginal),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
