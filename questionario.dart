import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSElecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSElecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSElecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //final List<Map<String, Object>>  pergunta = [
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSElecionada].cast()['resposta']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSElecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(resp.cast()['pontuacao']),
          );
        }).toList()
      ],
    );
  }
}
