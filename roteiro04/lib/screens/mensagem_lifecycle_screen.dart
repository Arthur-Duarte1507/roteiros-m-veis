import 'package:flutter/material.dart';

class MensagemLifecycleScreen extends StatefulWidget {
  const MensagemLifecycleScreen({super.key});

  @override
  State<MensagemLifecycleScreen> createState() =>
      _MensagemLifecycleScreenState();
}

class _MensagemLifecycleScreenState extends State<MensagemLifecycleScreen> {
  bool mensagemVisivel = true;
  final TextEditingController _controller = TextEditingController(
    text: 'Mensagem inicial visível',
  );

  @override
  void initState() {
    super.initState();
    debugPrint('Tela iniciada');
  }

  @override
  void dispose() {
    debugPrint('Tela finalizada');
    _controller.dispose();
    super.dispose();
  }

  void _alternarMensagem() {
    setState(() {
      mensagemVisivel = !mensagemVisivel;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Tela reconstruída');

    return Scaffold(
      appBar: AppBar(title: const Text('MensagemLifecycleScreen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite uma mensagem',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            if (mensagemVisivel)
              Text(
                _controller.text.isEmpty
                    ? 'Mensagem visível'
                    : _controller.text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _alternarMensagem,
              child: Text(
                mensagemVisivel ? 'Esconder mensagem' : 'Mostrar mensagem',
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar tela'),
            ),
          ],
        ),
      ),
    );
  }
}
