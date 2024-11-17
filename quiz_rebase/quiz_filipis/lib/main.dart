import 'package:flutter/material.dart';
import 'tela_inicial2.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatefulWidget {
  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio das Capitais',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, 
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, 
      ),
      home: TelaInicial(toggleTheme: _toggleTheme), 
      debugShowCheckedModeBanner: false,
    );
  }
}
