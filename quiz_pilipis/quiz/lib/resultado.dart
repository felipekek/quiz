import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;


  const TelaResultado({Key? key, required this.pontuacao, required this.totalPerguntas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz finalizado!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Você acertou $pontuacao de $totalPerguntas perguntas!',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                foregroundColor: Colors.white, 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Jogar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}


