import 'package:flutter/material.dart';

void main() {
  runApp(const Roteiro01App());
}

class Roteiro01App extends StatelessWidget {
  const Roteiro01App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roteiro 01',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MenuRoteiro01Page(),
    );
  }
}

class MenuRoteiro01Page extends StatelessWidget {
  const MenuRoteiro01Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roteiro 01 - Navegacao')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Exercicios',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Exercicio1TelaInicial(),
                ),
              );
            },
            child: const Text('Exercicio 1 - Push e Pop'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercicio2Tela1()),
              );
            },
            child: const Text('Exercicio 2 - Enviando Dados'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercicio3Tela1()),
              );
            },
            child: const Text('Exercicio 3 - Recebendo de Volta'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exercicio4Tela1()),
              );
            },
            child: const Text('Exercicio 4 - TextField e Retorno'),
          ),
        ],
      ),
    );
  }
}

class Exercicio1TelaInicial extends StatelessWidget {
  const Exercicio1TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 1 - TelaInicial')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Voce esta na Tela Inicial',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Exercicio1TelaDetalhe(),
                    ),
                  );
                },
                child: const Text('Ir para Detalhe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Exercicio1TelaDetalhe extends StatelessWidget {
  const Exercicio1TelaDetalhe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 1 - TelaDetalhe')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Voce esta na Tela de Detalhe',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Exercicio2Tela1 extends StatelessWidget {
  const Exercicio2Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 2 - Tela1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Exercicio2Tela2(nome: 'Maria'),
              ),
            );
          },
          child: const Text('Enviar Nome'),
        ),
      ),
    );
  }
}

class Exercicio2Tela2 extends StatelessWidget {
  const Exercicio2Tela2({required this.nome, super.key});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 2 - Tela2')),
      body: Center(
        child: Text('Ola, $nome', style: const TextStyle(fontSize: 26)),
      ),
    );
  }
}

class Exercicio3Tela1 extends StatefulWidget {
  const Exercicio3Tela1({super.key});

  @override
  State<Exercicio3Tela1> createState() => _Exercicio3Tela1State();
}

class _Exercicio3Tela1State extends State<Exercicio3Tela1> {
  int _valorAtual = 0;

  Future<void> _escolherNumero() async {
    final int? resultado = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (_) => const Exercicio3Tela2()),
    );

    if (!mounted || resultado == null) {
      return;
    }

    setState(() {
      _valorAtual = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 3 - Tela1')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Valor atual: $_valorAtual',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _escolherNumero,
              child: const Text('Escolher Numero'),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio3Tela2 extends StatelessWidget {
  const Exercicio3Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 3 - Tela2')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 10);
              },
              child: const Text('Enviar 10'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 20);
              },
              child: const Text('Enviar 20'),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4Tela1 extends StatefulWidget {
  const Exercicio4Tela1({super.key});

  @override
  State<Exercicio4Tela1> createState() => _Exercicio4Tela1State();
}

class _Exercicio4Tela1State extends State<Exercicio4Tela1> {
  int _valorAtual = 0;

  Future<void> _abrirEntradaNumero() async {
    final int? numero = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (_) => const Exercicio4Tela2()),
    );

    if (!mounted || numero == null) {
      return;
    }

    setState(() {
      _valorAtual = numero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 4 - Tela1')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Valor atual: $_valorAtual',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _abrirEntradaNumero,
              child: const Text('Escolher Numero Digitado'),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4Tela2 extends StatefulWidget {
  const Exercicio4Tela2({super.key});

  @override
  State<Exercicio4Tela2> createState() => _Exercicio4Tela2State();
}

class _Exercicio4Tela2State extends State<Exercicio4Tela2> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _retornarNumero() {
    final int? numero = int.tryParse(_controller.text.trim());
    if (numero == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite um numero inteiro valido.')),
      );
      return;
    }
    Navigator.pop(context, numero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 4 - Tela2')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um numero',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _retornarNumero,
              child: const Text('Retornar numero digitado'),
            ),
          ],
        ),
      ),
    );
  }
}
