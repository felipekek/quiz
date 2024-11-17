import 'package:flutter/material.dart';
import 'dart:async';  
import 'resultado.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.comCronometro});

  final String title;
  final bool comCronometro;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual é a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro', 'Salvador'],
      'respostaCorreta': 'Brasília',
      'imagem': 'lib/assets/BRASIL.png',
    },
    {
      'pergunta': 'Qual é a capital da França?',
      'opcoes': ['Londres', 'Madrid', 'Paris', 'Berlim'],
      'respostaCorreta': 'Paris',
      'imagem': 'lib/assets/frança.png', 
    },
     {
      'pergunta': 'Qual é a capital da Alemanha?',
      'opcoes': ['Belgica', 'Berlim', 'Moscou', 'Imalaia'],
      'respostaCorreta': 'Berlim',
      'imagem': 'lib/assets/alemanha2.png',
    },
    {
      'pergunta': 'Qual é a capital dos Estados Unidos?',
      'opcoes': ['Nova York', 'Washington', 'Brasília', 'Nepal'],
      'respostaCorreta': 'Washington',
      'imagem': 'lib/assets/estados_unidos.png',
    },
    {
      'pergunta': 'Qual é a capital da India"?',
      'opcoes': ['Horlando', 'Moscou', 'Felipinas', 'Nova Delhi'],
      'respostaCorreta': 'Nova Delhi',
      'imagem': 'lib/assets/india.png',
    },
    {
      'pergunta': 'Qual a capital do Japão?',
      'opcoes': ['Sinnoh', 'Tóquio', 'Peru', 'Kanto'],
      'respostaCorreta': 'Tóquio',
      'imagem': 'lib/assets/japao2.png',
    },
    {
      'pergunta': 'Qual a capital da Rússia?',
      'opcoes': ['Putin', 'Madagascar', 'Ucrânia', 'Moscou'],
      'respostaCorreta': 'Moscou',
      'imagem': 'lib/assets/russia.png',
    },
    {
      'pergunta': 'Qual é a capital do Congo?',
      'opcoes': ['Brazaville', 'Africa do Sul', 'Rabat', 'Abuja'],
      'respostaCorreta': 'Brazaville',
      'imagem': 'lib/assets/congo.png',
    },
    {
      'pergunta': 'Qual é a capital da China?',
      'opcoes': ['Alasca', 'Singapura', 'Pequim', 'Hong Kong'],
      'respostaCorreta': 'Pequim',
      'imagem': 'lib/assets/china.png',
    },
    {
      'pergunta': 'Qual é a capital da Austrália?',
      'opcoes': ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
      'respostaCorreta': 'Canberra',
      'imagem': 'lib/assets/australia.png',
    },
  ];

  int _indicePergunta = 0;
  int _pontuacao = 0;
  String _mensagem = '';
  int _tempoRestante = 10;  
  Timer? _timer;

  void _iniciarCronometro() {
    if (widget.comCronometro) {
      _tempoRestante = 10;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_tempoRestante > 0) {
            _tempoRestante--;
          } else {
            if (_indicePergunta < _perguntas.length - 1) {
              _indicePergunta++;
              _tempoRestante = 10; 
            } else {
              _pararCronometro();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultado(
                    pontuacao: _pontuacao,
                    totalPerguntas: _perguntas.length,
                  ),
                ),
              );
            }
          }
        });
      });
    }
  }

  void _pararCronometro() {
    _timer?.cancel();
  }

  void _verificarResposta(String respostaSelecionada) {
    setState(() {
      String respostaCorreta = _perguntas[_indicePergunta]['respostaCorreta'] as String;

      if (respostaSelecionada == respostaCorreta) {
        _pontuacao++;
        _mensagem = 'Correto!';
      } else {
        _mensagem = 'Incorreto! A resposta correta é $respostaCorreta.';
      }

      if (_indicePergunta < _perguntas.length - 1) {
        _indicePergunta++;
        if (widget.comCronometro) {
          _tempoRestante = 10;  
        }
      } else {
        _pararCronometro();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaResultado(
              pontuacao: _pontuacao,
              totalPerguntas: _perguntas.length,
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.comCronometro) {
      _iniciarCronometro();  
    }
  }

  @override
  void dispose() {
    _pararCronometro();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutos = _tempoRestante ~/ 60;
    int segundos = _tempoRestante % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pergunta ${_indicePergunta + 1} de ${_perguntas.length}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            if (widget.comCronometro) 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tempo restante: ${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            Expanded(
              flex: 5,
              child: Image.asset(
                _perguntas[_indicePergunta]['imagem'] as String,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _perguntas[_indicePergunta]['pergunta'] as String,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ...(_perguntas[_indicePergunta]['opcoes'] as List<String>).map((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () => _verificarResposta(opcao),
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    Text(
                      _mensagem,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
