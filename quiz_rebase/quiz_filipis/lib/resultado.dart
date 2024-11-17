import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;

  const TelaResultado({
    Key? key,
    required this.pontuacao,
    required this.totalPerguntas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mensagemFinal = '';
    String imagemResultado = '';

    if (pontuacao == 0) {
      mensagemFinal = 'Você Fracassou!!';
      imagemResultado = 'lib/assets/fracaco.png'; 
    } else if (pontuacao >= 1 && pontuacao <= 3) {
      mensagemFinal = 'Você foi mal!!';
      imagemResultado = 'lib/assets/Parabens viu.png'; 
    } else if (pontuacao >= 4 && pontuacao <= 6) {
      mensagemFinal = 'Você foi Bem!!';
      imagemResultado = 'lib/assets/bem.png'; 
    } else if (pontuacao >= 7 && pontuacao <= 9) {
      mensagemFinal = 'Você foi Otimo!!';
      imagemResultado = 'lib/assets/otimo.png'; 
    } else if (pontuacao == 10) {
      mensagemFinal = 'Perfeito!!';
      imagemResultado = 'lib/assets/perfeito.png'; 
    }

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
            Text(
              mensagemFinal,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              imagemResultado,
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
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
