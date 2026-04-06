import 'package:flutter/material.dart';

import '../widgets/product_tile.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
      appBar: AppBar(title: const Text('Produtos')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ProductTile(nome: produtos[index]);
        },
      ),
    );
  }
}
