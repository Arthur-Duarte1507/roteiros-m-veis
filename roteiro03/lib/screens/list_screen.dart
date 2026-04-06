import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> produtos = [
      'Arroz',
      'Feijao',
      'Macarrao',
      'Leite',
      'Cafe',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista Simples')),
      body: ListView(
        children: produtos
            .map((produto) => ListTile(title: Text(produto)))
            .toList(),
      ),
    );
  }
}
