# Caderno de Campo do Vale: Checklist de colheita

Este repositório implementa a funcionalidade G do app principal Caderno de Campo do Vale. O projeto foi desenvolvido no IF Goiano, Campus Ceres, para a disciplina de Programação para Dispositivos Móveis.

## Visão geral

O aplicativo apresenta um checklist para acompanhar tarefas da colheita de soja e milho no Vale de São Patrício. A tela permite marcar tarefas, consultar o percentual concluído, filtrar a lista e adicionar novas tarefas.

## Funcionalidades

- Lista inicial com sete tarefas relacionadas à colheita de soja e milho.
- Marcação e desmarcação de tarefas com toque.
- Exibição do percentual de conclusão.
- Adição de tarefa própria, com validação de campo vazio, limite de 80 caracteres e duplicidade.
- Filtros pelas abas Todos, A fazer e Concluídos.
- Retorno à aba Todos após adicionar uma tarefa.
- Faixa de contexto regional do Vale de São Patrício.
- Tema verde institucional na cor #1E5631.

## Estrutura do projeto

```text
.
├── .idea/
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
├── linux/
├── macos/
├── test/
│   └── widget_test.dart
├── web/
├── windows/
├── .gitattributes
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── caderno_campo.iml
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

## Requisitos

- Flutter SDK instalado e configurado.
- Emulador Android ou dispositivo físico conectado para executar o aplicativo.
- Dependências resolvidas com `flutter pub get`.

## Como executar

Na pasta do projeto, execute:

```bash
flutter pub get
flutter run
```

## Testes

1. Verifica o título da tela, o percentual inicial e a seleção da aba Todos.
2. Verifica a mensagem exibida ao tentar adicionar um campo vazio.
3. Verifica a inclusão de uma tarefa válida e a limpeza do campo.
4. Verifica a atualização do percentual ao tocar em uma tarefa.
5. Verifica o retorno à aba Todos e a exibição da nova tarefa após adicionar na aba Concluídos.
6. Verifica que a mensagem de erro desaparece quando o usuário digita no campo.
7. Verifica que uma tarefa duplicada, mesmo com letras maiúsculas diferentes, não é adicionada.
8. Verifica que uma tarefa com mais de 80 caracteres é recusada.
9. Verifica a exibição da faixa de contexto regional ao iniciar o aplicativo.

## Equipe

| Papel | Responsável | O que construiu |
|---|---|---|
| Construtor | Felipe Ramos | Lógica e estado em lib/telas/tela_checklist.dart: classe Tarefa (lib/modelos/tarefa.dart), alternar item com setState, cálculo do percentual, validação do novo item, filtro por aba. |
| Designer de interface | Luanna Fernandes | Layout e decisões de campo em lib/widgets/: item com alvo de toque mínimo de 64 e contraste forte, faixa de percentual, barra de filtros, tema verde institucional (#1E5631). |
| Relator | Tiago Cardoso | README, roteiro e condução da demonstração ao vivo, visão geral do trabalho. |

## Requisitos mínimos do enunciado

| Requisito | Como foi atendido | Onde no código |
|---|---|---|
| Rodar sem erros no emulador Android ou dispositivo físico | flutter analyze e flutter test sem erros. Executado com flutter run em: (preencher o emulador ou dispositivo usado) | Validação do projeto |
| Widget de layout e lista ou formulário | Column, Row, Container, ListView.builder e TextField com botão | lib/telas/tela_checklist.dart e lib/widgets/ |
| Estado com setState | Alternar item, adicionar item e trocar de aba | lib/telas/tela_checklist.dart |
| Evento além do toque simples | onChanged do TextField limpa o erro ao digitar, e _adicionarItem valida a entrada | lib/telas/tela_checklist.dart |
| Validação da entrada com mensagem clara | Validação de campo vazio, texto com mais de 80 caracteres e tarefa duplicada | _adicionarItem em lib/telas/tela_checklist.dart |
| Dados do contexto regional | Tarefas de soja, milho, talhões e armazém, além da faixa do Vale de São Patrício | lib/telas/tela_checklist.dart |
| README com o que faz, como rodar e o que cada integrante construiu | Visão geral, funcionalidades, instruções de execução e equipe | README.md, seções Como executar e Equipe |
