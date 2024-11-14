import 'package:flutter/material.dart';
import 'resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz das Capita',
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

/// Página inicial do quiz
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de perguntas e respostas para o quiz
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
      'imagem': 'lib/assets/japao.ng.png',
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

    // Outras perguntas com chave 'imagem' específica...
  

  int _indicePergunta = 0;
  int _pontuacao = 0;
  String _mensagem = '';

  /// Função para verificar a resposta do usuário e avançar para a próxima pergunta
 void _verificarResposta(String respostaSelecionada) {
  setState(() {
    String respostaCorreta = _perguntas[_indicePergunta]['respostaCorreta'] as String;

    if (respostaSelecionada == respostaCorreta) {
      _pontuacao++;
      _mensagem = 'Correto!';
    } else {
      _mensagem = 'Incorreto! A resposta correta é $respostaCorreta.';
    }

    // Avança para a próxima pergunta ou vai para a tela de resultados
    if (_indicePergunta < _perguntas.length - 1) {
      _indicePergunta++;
    } else {
      // Navega para a tela de resultado sem resetar o estado
      Navigator.pop(context);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Exibe a imagem correspondente à pergunta atual
            Expanded(
              flex: 5,
              child: Image.asset(
                _perguntas[_indicePergunta]['imagem'] as String, // Usa o caminho da imagem da pergunta atual
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
                    // Exibe o texto da pergunta
                    Text(
                      _perguntas[_indicePergunta]['pergunta'] as String,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Exibe as opções de resposta
                    ...(_perguntas[_indicePergunta]['opcoes'] as List<String>)
                        .map((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () => _verificarResposta(opcao),
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    // Exibe a mensagem de feedback (correto ou incorreto)
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
