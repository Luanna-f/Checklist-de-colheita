// Tarefa segue o padrão imutável da classe Talhao vista em aula.
// Para alterar sua conclusão, a tela cria outra Tarefa e a substitui na lista.
class Tarefa {
  final String texto;
  final bool concluido;

  const Tarefa({required this.texto, this.concluido = false});
}
