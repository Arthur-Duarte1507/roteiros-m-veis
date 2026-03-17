import 'package:flutter/material.dart';

void main() {
  runApp(const TrabalhoFinalApp());
}

class TrabalhoFinalApp extends StatelessWidget {
  const TrabalhoFinalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Final',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AtividadeFinalPage(),
    );
  }
}

class AtividadeFinalPage extends StatefulWidget {
  const AtividadeFinalPage({super.key});

  @override
  State<AtividadeFinalPage> createState() => _AtividadeFinalPageState();
}

class _AtividadeFinalPageState extends State<AtividadeFinalPage> {
  bool _animado = false;

  void _executarAnimacao() {
    setState(() {
      _animado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Atividade Final'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              width: _animado ? 240 : 150,
              height: _animado ? 240 : 150,
              decoration: BoxDecoration(
                color: _animado ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 900),
                opacity: _animado ? 1 : 0,
                child: const Text(
                  'Texto aparecendo!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _executarAnimacao,
              child: const Text('Animar'),
            ),
          ],
        ),
      ),
    );
  }
}
