// Checklist de Colheita — PROJETO INICIAL (esqueleto)
// Funcionalidade G do Caderno de Campo do Vale
// Programação para Dispositivos Móveis · IF Goiano — Campus Ceres
//
// O QUE VAMOS CONSTRUIR
// Uma tela com a lista de tarefas da colheita. O produtor toca em um item
// para marcá-lo como feito (ou desmarcá-lo), vê o percentual concluído
// atualizar a cada toque e pode adicionar tarefas próprias.
//
// COMO USAR ESTE ESQUELETO
// Tudo o que está marcado "JÁ PRONTO" só precisa ser lido e entendido.
// Cada trecho a completar está marcado com "TODO PASSO N". Vá
// preenchendo na ordem, salvando e vendo o hot reload aplicar cada
// mudança. O app já roda desde o primeiro minuto (mostra 0% e a lista
// vazia); ele vai ganhando vida a cada passo.
//
// IDEIA CENTRAL: DUAS LISTAS PARALELAS
// _itens[indice] guarda o texto da tarefa e _concluido[indice] guarda se
// ela já foi feita. As duas listas SEMPRE têm o mesmo tamanho e a mesma
// ordem: a posição 2 de uma corresponde à posição 2 da outra.
//
// COMO RODAR (uma vez, no terminal, dentro desta pasta):
//   flutter create .
//   flutter pub get
//   flutter run

import 'package:flutter/material.dart';

void main() => runApp(const ChecklistApp());

// =====================================================================
// O app e o tema  (JÁ PRONTO)
// =====================================================================
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

// =====================================================================
// A tela com estado  (JÁ PRONTO)
// É StatefulWidget porque o conteúdo muda: itens marcados e novos itens.
// =====================================================================
class TelaChecklist extends StatefulWidget {
  const TelaChecklist({super.key});

  @override
  State<TelaChecklist> createState() => _TelaChecklistState();
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

  // =====================================================================
  // A interface  (JÁ PRONTO, exceto o PASSO 4)
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    // O percentual vem da função do PASSO 1 e é recalculado a cada
    // setState(), porque o build roda de novo.
    final percentual = _calcularPercentual();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist de colheita'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _PercentualConcluido(percentual: percentual),

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

          // ---------------------------------------------------------------
          // TODO PASSO 4 — Monte a lista com ListView.builder.
          // - itemCount: quantos itens existem (_itens.length).
          // - itemBuilder: para cada indice, devolva um _ItemChecklist
          //   (já pronto lá embaixo), passando:
          //     texto:     _itens[indice]
          //     concluido: _concluido[indice]
          //     aoTocar:   uma função sem parâmetros que chama
          //                _alternarItem(indice)
          //
          // ListView.builder(
          //   itemCount: ...,
          //   itemBuilder: (context, indice) {
          //     return _ItemChecklist(...);
          //   },
          // )
          //
          // Por enquanto itemCount é 0 só para o app compilar.
          // ---------------------------------------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: 0,
              itemBuilder: (context, indice) {
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================================
// Faixa de percentual.  (JÁ PRONTO — já usada na tela)
// Recebe o percentual já calculado; quem calcula é o PASSO 1.
// =====================================================================
class _PercentualConcluido extends StatelessWidget {
  final double percentual;

  const _PercentualConcluido({required this.percentual});

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

// =====================================================================
// Item do checklist.  (JÁ PRONTO — pronto para usar no PASSO 4)
// Pensado para uso no campo, com luva e sol forte:
// - alvo de toque grande (altura mínima de 64 e linha inteira tocável);
// - contraste forte: concluído = fundo verde, texto branco e riscado;
//   pendente = fundo branco, borda verde e texto escuro.
// A lógica do toque NÃO está aqui: ela chega pelo parâmetro aoTocar.
// =====================================================================
class _ItemChecklist extends StatelessWidget {
  final String texto;
  final bool concluido;
  final VoidCallback aoTocar;

  const _ItemChecklist({
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
