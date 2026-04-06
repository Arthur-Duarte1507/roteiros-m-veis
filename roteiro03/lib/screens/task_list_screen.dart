import 'package:flutter/material.dart';

import '../widgets/task_tile.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tarefas = <String>[];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adicionarTarefa() {
    final String texto = _controller.text.trim();
    if (texto.isEmpty) {
      return;
    }

    setState(() {
      _tarefas.add(texto);
    });
    _controller.clear();
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite uma tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _adicionarTarefa(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _adicionarTarefa,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa adicionada.'))
                  : ListView.builder(
                      itemCount: _tarefas.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          tarefa: _tarefas[index],
                          onRemove: () => _removerTarefa(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
