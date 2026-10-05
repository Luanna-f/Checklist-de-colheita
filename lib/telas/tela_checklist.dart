// A tela guarda as tarefas, a aba selecionada e a mensagem de erro.
// A cada setState, o build recalcula o percentual e os itens exibidos.

import 'package:flutter/material.dart';

import '../modelos/tarefa.dart';
import '../widgets/barra_de_filtros.dart';
import '../widgets/item_checklist.dart';
import '../widgets/percentual_concluido.dart';

class TelaChecklist extends StatefulWidget {
  const TelaChecklist({super.key});

  @override
  State<TelaChecklist> createState() => _TelaChecklistState();
}

class _TelaChecklistState extends State<TelaChecklist> {
  final List<Tarefa> _tarefas = [
    const Tarefa(
      texto: 'Regular a plataforma de corte da colheitadeira para a soja',
    ),
    const Tarefa(
      texto: 'Conferir a umidade dos grãos de soja antes de iniciar a colheita',
    ),
    const Tarefa(
      texto: 'Calibrar os sensores de perda de grãos na colheitadeira',
    ),
    const Tarefa(
      texto: 'Vistoriar os talhões: tombamento, plantas daninhas e falhas de plantio',
    ),
    const Tarefa(
      texto: 'Revisar a plataforma e as correntes para a colheita do milho',
    ),
    const Tarefa(
      texto: 'Agendar caminhões para levar a produção até o armazém',
    ),
    const Tarefa(
      texto:
          'Limpar a caixa de grãos e a rosca de descarga antes de cada talhão',
    ),
  ];

  final _novoItemController = TextEditingController();

  String? _erro;

  // As abas usam um número no estado: 0 para Todos, 1 para A fazer e 2 para Concluídos.
  int _abaSelecionada = 0;

  @override
  void dispose() {
    _novoItemController.dispose();
    super.dispose();
  }

  double _calcularPercentual() {
    if (_tarefas.isEmpty) {
      return 0.0;
    }

    int concluidos = 0;
    for (int i = 0; i < _tarefas.length; i++) {
      if (_tarefas[i].concluido) {
        concluidos++;
      }
    }

    return (concluidos / _tarefas.length) * 100;
  }

  void _alternarItem(int indice) {
    setState(() {
      final tarefaAtual = _tarefas[indice];
      // A nova tarefa substitui a antiga para que setState redesenhe a tela.
      _tarefas[indice] = Tarefa(
        texto: tarefaAtual.texto,
        concluido: !tarefaAtual.concluido,
      );
    });
  }

  void _adicionarItem() {
    final texto = _novoItemController.text.trim();

    if (texto.isEmpty) {
      setState(() {
        _erro = 'Digite uma tarefa antes de adicionar.';
      });
      return;
    }

    if (texto.length > 80) {
      setState(() {
        _erro = 'Use no máximo 80 caracteres.';
      });
      return;
    }

    if (_jaExiste(texto)) {
      setState(() {
        _erro = 'Essa tarefa já está na lista.';
      });
      return;
    }

    setState(() {
      _tarefas.add(Tarefa(texto: texto));
      _erro = null;
      // A tarefa nova fica visível mesmo quando a aba atual era Concluídos.
      _abaSelecionada = 0;
    });

    _novoItemController.clear();
  }

  bool _jaExiste(String texto) {
    for (int i = 0; i < _tarefas.length; i++) {
      if (_tarefas[i].texto.toLowerCase() == texto.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  List<int> _indicesFiltrados() {
    final indices = <int>[];
    for (int i = 0; i < _tarefas.length; i++) {
      if (_abaSelecionada == 0) {
        indices.add(i);
      } else if (_abaSelecionada == 1 && !_tarefas[i].concluido) {
        indices.add(i);
      } else if (_abaSelecionada == 2 && _tarefas[i].concluido) {
        indices.add(i);
      }
    }
    // Os índices originais permitem alterar a tarefa certa, pois a posição filtrada pode ser diferente.
    return indices;
  }

  @override
  Widget build(BuildContext context) {
    final percentual = _calcularPercentual();
    final indicesFiltrados = _indicesFiltrados();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist de colheita'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Colheita no Vale de São Patrício: soja e milho',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF1E5631)),
            ),
          ),
          PercentualConcluido(percentual: percentual),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _novoItemController,
                    onChanged: (valor) {
                      if (_erro != null) {
                        setState(() {
                          _erro = null;
                        });
                      }
                    },
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

          BarraDeFiltros(
            abaSelecionada: _abaSelecionada,
            aoSelecionar: (novaAba) {
              setState(() {
                _abaSelecionada = novaAba;
              });
            },
          ),

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
                      final tarefa = _tarefas[indiceOriginal];
                      return ItemChecklist(
                        texto: tarefa.texto,
                        concluido: tarefa.concluido,
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
