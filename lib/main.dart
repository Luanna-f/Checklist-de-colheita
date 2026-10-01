// =============================================================
// Caderno de Campo do Vale
// Funcionalidade G: Checklist de colheita
// Disciplina: Programação para Dispositivos Móveis - IF Goiano, Campus Ceres
//
// Como usar este arquivo:
// - Trechos marcados "JÁ PRONTO" não precisam ser escritos à mão.
//   Leia, entenda e, na arguição, saiba explicar cada um.
// - Trechos marcados "TODO PASSO N" são de vocês. Cada um explica
//   o que fazer e quais conceitos de aula usar.
// =============================================================

// JÁ PRONTO: import do Flutter padrão (nenhum pacote externo)
import 'package:flutter/material.dart';

// JÁ PRONTO: ponto de entrada do app
void main() {
  runApp(const CadernoDeCampoApp());
}

// JÁ PRONTO: MaterialApp com o tema na cor institucional (verde IF Goiano)
class CadernoDeCampoApp extends StatelessWidget {
  const CadernoDeCampoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderno de Campo do Vale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E5631),
          primary: const Color(0xFF1E5631),
        ),
        useMaterial3: true,
      ),
      home: const TelaChecklistColheita(),
    );
  }
}

// JÁ PRONTO: tela com estado (StatefulWidget), pois a lista muda na tela
class TelaChecklistColheita extends StatefulWidget {
  const TelaChecklistColheita({super.key});

  @override
  State<TelaChecklistColheita> createState() => _TelaChecklistColheitaState();
}

class _TelaChecklistColheitaState extends State<TelaChecklistColheita> {
  // JÁ PRONTO: lista com o texto de cada tarefa.
  // Mesmo padrão dos talhões da aula: acessamos por índice, itens[indice].
  List<String> itens = [
    'Regular a plataforma de corte da colheitadeira para a soja',
    'Conferir a umidade dos grãos de soja antes de iniciar a colheita',
    'Calibrar os sensores de perda de grãos na colheitadeira',
    'Vistoriar os talhões: tombamento, plantas daninhas e falhas de plantio',
    'Revisar a plataforma e as correntes para a colheita do milho',
    'Agendar caminhões para levar a produção até o armazém',
    'Limpar a caixa de grãos e a rosca de descarga antes de cada talhão',
  ];

  // JÁ PRONTO: lista paralela. concluido[indice] diz se itens[indice]
  // já foi feito. As duas listas SEMPRE têm o mesmo tamanho.
  List<bool> concluido = [false, false, false, false, false, false, false];

  // JÁ PRONTO: controller do campo "novo item"
  final TextEditingController controladorNovoItem = TextEditingController();

  // JÁ PRONTO: mensagem de erro do campo (vazia = sem erro).
  // Usada no PASSO 3 para avisar o produtor.
  String mensagemErro = '';

  // JÁ PRONTO: libera a memória do controller quando a tela sai
  @override
  void dispose() {
    controladorNovoItem.dispose();
    super.dispose();
  }

  // -----------------------------------------------------------
  // TODO PASSO 1: calcular o percentual concluído
  // -----------------------------------------------------------
  // O que fazer:
  //   - Percorrer a lista concluido e contar quantos valores são true.
  //   - Dividir pelo total de itens e multiplicar por 100.
  //   - Devolver o resultado como double (0.0 a 100.0).
  // Cuidado: se a lista estiver vazia, o total é 0 e não dá para dividir.
  //   Trate esse caso e devolva 0.0.
  // Conceitos: for com índice, if, variável contadora, lista.length,
  //   divisão entre int e double.
  // Por enquanto, a função devolve 0.0 só para o app compilar.
  double calcularPercentual() {
    // TODO PASSO 1: escreva o cálculo aqui
    return 0.0;
  }

  // -----------------------------------------------------------
  // TODO PASSO 2: alternar o item entre concluído e pendente
  // -----------------------------------------------------------
  // O que fazer:
  //   - Dentro de setState, inverter concluido[indice]:
  //     se era true vira false, se era false vira true.
  // Conceitos: setState, acesso por índice, operador ! (negação).
  // Esta função é chamada quando o produtor toca em um item
  // (ela é passada como callback no PASSO 4).
  void alternarItem(int indice) {
    // TODO PASSO 2: escreva a lógica aqui, dentro de setState
  }

  // -----------------------------------------------------------
  // TODO PASSO 3: adicionar um novo item
  // -----------------------------------------------------------
  // O que fazer:
  //   1. Ler o texto de controladorNovoItem.text (use trim() para
  //      ignorar espaços).
  //   2. Se estiver vazio, mostrar erro: dentro de setState, guardar
  //      em mensagemErro um texto claro (ex.: dizer o que o produtor
  //      deve fazer) e sair da função (return).
  //   3. Se estiver preenchido, dentro de setState:
  //        - adicionar o texto em itens;
  //        - adicionar false em concluido (as duas listas crescem juntas!);
  //        - limpar mensagemErro.
  //   4. Limpar o controller (controladorNovoItem.clear()).
  // Conceitos: TextEditingController, validação de entrada, if, return,
  //   List.add, setState.
  void adicionarItem() {
    // TODO PASSO 3: escreva a função aqui
  }

  // JÁ PRONTO: montagem da tela
  @override
  Widget build(BuildContext context) {
    // JÁ PRONTO: o percentual vem da função do PASSO 1
    double percentual = calcularPercentual();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist de colheita'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // JÁ PRONTO: widget do percentual (recebe o valor já calculado)
          PercentualConcluido(percentual: percentual),

          // JÁ PRONTO: campo e botão para adicionar item próprio
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: controladorNovoItem,
                    decoration: InputDecoration(
                      labelText: 'Novo item',
                      border: const OutlineInputBorder(),
                      // Mostra a mensagem de erro do PASSO 3 (null = sem erro)
                      errorText: mensagemErro.isEmpty ? null : mensagemErro,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: adicionarItem,
                    child: const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ),

          // -------------------------------------------------------
          // TODO PASSO 4: montar a lista de itens com ListView.builder
          // -------------------------------------------------------
          // O que fazer:
          //   - Em itemCount, informar quantos itens existem (itens.length).
          //   - Em itemBuilder, para cada indice, devolver um
          //     ItemChecklist (widget abaixo) passando:
          //       texto:     itens[indice]
          //       concluido: concluido[indice]
          //       aoTocar:   uma função que chama alternarItem(indice)
          // Conceitos: ListView.builder, acesso por índice, callback.
          // Dica: o callback é uma função sem parâmetros, então
          //   use () { ... } e chame alternarItem(indice) lá dentro.
          // Por enquanto, itemCount é 0 só para o app compilar.
          Expanded(
            child: ListView.builder(
              itemCount: 0, // TODO PASSO 4: troque pelo total de itens
              itemBuilder: (context, indice) {
                // TODO PASSO 4: devolva um ItemChecklist aqui
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// JÁ PRONTO: widget que mostra "X% concluído".
// Recebe o percentual já calculado (o cálculo é o PASSO 1).
class PercentualConcluido extends StatelessWidget {
  final double percentual;

  const PercentualConcluido({super.key, required this.percentual});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFE8F1EA),
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

// JÁ PRONTO: visual de um item do checklist, pensado para uso no campo:
// - alvo de toque grande (altura mínima de 64, linha inteira clicável)
// - contraste forte: concluído = fundo verde, texto branco e riscado;
//   pendente = fundo branco, borda e texto escuros.
// A lógica do toque NÃO está aqui: ela chega pelo parâmetro aoTocar,
// que vocês ligam no PASSO 4 (e implementam no PASSO 2).
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
    Color corFundo = concluido ? const Color(0xFF1E5631) : Colors.white;
    Color corTexto = concluido ? Colors.white : Colors.black87;

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
