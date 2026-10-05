# Caderno de Campo do Vale: Checklist de colheita

Este repositório implementa a funcionalidade G do app principal Caderno de Campo do Vale, desenvolvido no IF Goiano, Campus Ceres, na disciplina de Programação para Dispositivos Móveis. A proposta do projeto é oferecer um checklist para organização das etapas de colheita da soja e do milho durante a rotina de campo.

## Visão geral

O app foi pensado para uso em campo, com interface direta, visual institucional e foco na rapidez na marcação de tarefas. Ele permite acompanhar o que já foi concluído, o que precisa ser feito e quais itens ainda precisam atenção na colheita.

## Funcionalidades

- Lista inicial com sete tarefas da rotina de colheita.
- Marcação e desmarcação de itens com toque simples.
- Cálculo automático do percentual geral de conclusão.
- Validação do campo de novo item antes de adicionar.
- Filtro por abas: Todos, A fazer e Concluídos.
- Tema visual verde institucional, com contraste forte e ação de toque em área ampla.

## Estrutura do projeto

```text
.
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── modelos/
│   │   └── tarefa.dart
│   ├── telas/
│   │   └── tela_checklist.dart
│   └── widgets/
│       ├── barra_de_filtros.dart
│       ├── item_checklist.dart
│       └── percentual_concluido.dart
├── test/
│   └── widget_test.dart
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
├── .gitignore
├── .metadata
└── .idea/
```

## Requisitos

- Flutter SDK instalado e configurado.
- Emulador Android ou iOS em execução, ou dispositivo físico conectado.
- Dependências do Flutter resolvidas com flutter pub get.

## Como executar

Na pasta do projeto, execute os comandos abaixo:

```bash
flutter pub get
flutter run
```

## Testes

Os testes automatizados validam a inicialização da aplicação, a mensagem de erro para campo vazio, a adição de novos itens, a mudança do percentual ao concluir tarefas e o retorno à aba Todos ao adicionar um item em Concluídos.

## Equipe

| Papel | Responsável | O que construiu |
|---|---|---|
| Construtor | Felipe Ramos | Lógica e estado em lib/telas/tela_checklist.dart: classe Tarefa (lib/modelos/tarefa.dart), alternar item com setState, cálculo do percentual, validação do novo item, filtro por aba. |
| Designer de interface | Luanna Fernandes | Layout e decisões de campo em lib/widgets/: item com alvo de toque mínimo de 64 e contraste forte, faixa de percentual, barra de filtros, tema verde institucional (#1E5631). |
| Relator | Tiago Cardoso | README, roteiro e condução da demonstração ao vivo, visão geral do trabalho. |

## Requisitos do enunciado atendidos

1. Estado do checklist em setState, com atualização de tarefas e cálculo do percentual em lib/telas/tela_checklist.dart.
2. Classe Tarefa imutável em lib/modelos/tarefa.dart, com final String texto e final bool concluido e construtor const.
3. Validação de entrada em _adicionarItem em lib/telas/tela_checklist.dart, com a mensagem "Digite uma tarefa antes de adicionar.".
4. Layout com Column, Row, Container e ListView.builder em lib/telas/tela_checklist.dart e widgets em lib/widgets/.
5. Filtro por abas em BarraDeFiltros e indicesFiltrados em tela_checklist.dart, preservando o índice original para ordenar corretamente os itens.
6. Dados regionais do contexto do projeto: soja, milho, talhões, armazém e rotina de campo, presentes nas tarefas iniciais em lib/telas/tela_checklist.dart.
7. Identidade do app e funcionalidade G no MaterialApp e metadados de plataforma em lib/main.dart, android/app/src/main/AndroidManifest.xml e ios/Runner/Info.plist.

## Observações finais

A solução foi implementada seguindo as regras do enunciado, sem pacotes extras, sem persistência e sem alteração do comportamento visual fora do que foi pedido. O foco principal foi manter a interface simples, a lógica correta e o alinhamento com a avaliação prática do curso.
