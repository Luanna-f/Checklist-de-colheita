# Caderno de Campo do Vale — Checklist de colheita

Aplicativo educacional em Flutter desenvolvido para a disciplina de **Programação para Dispositivos Móveis** no IF Goiano — Campus Ceres.

A funcionalidade **Checklist de colheita** auxilia o produtor a acompanhar as tarefas antes e durante a colheita de soja e milho no Vale de São Patrício. A proposta é oferecer uma ferramenta simples, prática e visualmente clara para organização de rotina operacional no campo.

## Visão geral

O app permite:

- visualizar uma lista de tarefas de colheita;
- marcar e desmarcar itens com toque;
- acompanhar o percentual geral de conclusão;
- inserir tarefas personalizadas;
- filtrar a lista por aba: Todos, A fazer e Concluídos;
- manter uma interface pronta para uso em campo, com identidade visual institucional do IF Goiano.

## Funcionalidades implementadas

- Lista inicial de tarefas relacionadas à colheita;
- Toggle de conclusão para cada item;
- Cálculo automático do progresso em porcentagem;
- Validação do campo de nova tarefa antes de adicionar;
- Exibição de mensagem de erro ao tentar inserir um item vazio;
- Filtros por status da tarefa;
- Tema visual verde institucional (`#1E5631`).

## Estrutura do projeto

```text
.
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── telas/
│   │   └── tela_checklist.dart
│   └── widgets/
│       ├── barra_de_filtros.dart
│       ├── item_checklist.dart
│       └── percentual_concluido.dart
├── test/
│   └── widget_test.dart
├── web/
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
└── .gitignore
```

## Requisitos

- Flutter SDK instalado e configurado;
- Emulador ou dispositivo físico para execução;
- Acesso à internet para baixar dependências do Flutter.

## Como executar

Na pasta do projeto, execute:

```bash
flutter pub get
flutter run
```

Se o Flutter ainda não tiver criado o projeto em uma máquina nova, o comando abaixo pode ser usado uma vez para inicializar a estrutura local:

```bash
flutter create .
flutter pub get
flutter run
```

Depois disso, mantenha o arquivo principal do projeto como [lib/main.dart](lib/main.dart), que já aponta para a tela principal do checklist.

## Identidade do app

- Nome do app: `Checklist de Colheita`
- ID do pacote: `br.edu.ifgoiano.ceres.caderno_campo`
- Cor institucional: `#1E5631` (verde IF Goiano)

## Equipe

| Papel | Responsável |
|---|---|
| Construtor | Felipe Ramos |
| Designer de interface | Luanna Fernandes |
| Relator | Tiago Cardoso |

## Observações

Este projeto foi pensado como uma solução educacional para o uso em dispositivos móveis, com foco em simplicidade, clareza visual e organização de tarefas no campo. A interface e a lógica foram desenvolvidas para simular a rotina real de um produtor durante a colheita, com foco em acompanhamento de execução e rastreio do progresso.

## Validação e testes

O projeto inclui testes de widget para verificar a inicialização da aplicação e o comportamento de adição de tarefas. Para executar os testes:

```bash
flutter test
```
