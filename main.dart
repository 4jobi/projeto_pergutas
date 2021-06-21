import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSElecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': '10'},
        {'texto': 'Vermelho', 'pontuacao': '8'},
        {'texto': 'Verde', 'pontuacao': '5'},
        {'texto': 'Amarelo', 'pontuacao': '4'},
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': '8'},
        {'texto': 'Cobra', 'pontuacao': '7'},
        {'texto': 'Elefante', 'pontuacao': '5'},
        {'texto': 'Leão', 'pontuacao': '4'},
      ]
    },
    {
      'texto': 'Qual é seu carro favorito?',
      'resposta': [
        {'texto': 'Fusca', 'pontuacao': '10'},
        {'texto': 'Corcel', 'pontuacao': '7'},
        {'texto': 'Chevete', 'pontuacao': '5'},
        {'texto': 'Monza', 'pontuacao': '4'},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSElecionada++;
        _pontuacaoTotal += pontuacao;
        //print(_perguntaSElecionada);
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSElecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Center(
                child: Text('Perguntas'),
              ),
            ],
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSElecionada: _perguntaSElecionada,
                responder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
