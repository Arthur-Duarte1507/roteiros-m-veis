import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.nome, super.key});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.inventory_2_outlined),
      title: Text(nome),
      subtitle: const Text('Produto disponivel'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
