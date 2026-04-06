import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/title_text.dart';
import 'detail_screen.dart';
import 'list_screen.dart';
import 'product_screen.dart';
import 'profile_screen.dart';
import 'task_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TitleText(text: 'Roteiro 02'),
          const SizedBox(height: 12),
          const Text('Exercicio 2'),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Ir para Detalhe',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DetailScreen()),
              );
            },
          ),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Ir para Perfil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          const Text('Exercicios 4 a 8'),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Ir para Produtos',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductScreen()),
              );
            },
          ),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Ir para Lista Simples',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          const Text('Exercicio 9'),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Ir para Lista de Tarefas',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaskListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
