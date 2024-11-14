import 'package:flutter/material.dart';
import 'quiz2.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz das Capitais'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/mapa.png', 
              width: 700,
              height: 550,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao Quiz das Capitais!!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Quiz das Capitais')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                foregroundColor: Colors.white, 
              ),
              child: const Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
