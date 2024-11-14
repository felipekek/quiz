import 'package:flutter/material.dart';
import 'tela_inicial2.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio das Capitais',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}