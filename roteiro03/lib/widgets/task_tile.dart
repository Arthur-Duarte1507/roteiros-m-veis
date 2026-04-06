import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({required this.tarefa, required this.onRemove, super.key});

  final String tarefa;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(tarefa),
        trailing: IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.delete),
          tooltip: 'Remover tarefa',
        ),
      ),
    );
  }
}
