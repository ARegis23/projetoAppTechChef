import 'package:flutter/material.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tech Chef - Versao Uno',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text('Corpo do Aplicativo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Adicionar ação aqui
          },
          child: Icon(Icons.add),
        )
      )
    );
  }
}