import 'package:flutter/material.dart';

void main() {
  runApp(const Tbl02MoveisApp());
}

class Tbl02MoveisApp extends StatelessWidget {
  const Tbl02MoveisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicios de Animacao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ExerciciosAnimacoesPage(),
    );
  }
}

class ExerciciosAnimacoesPage extends StatelessWidget {
  const ExerciciosAnimacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista 02 - Animacoes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExercicioCard(
            titulo: 'Exercicio 1',
            descricao:
                'Modificar o exemplo do AnimatedContainer para animar cor e altura.',
            child: Exercicio1(),
          ),
          SizedBox(height: 16),
          ExercicioCard(
            titulo: 'Exercicio 2',
            descricao:
                'Criar animacao que aumenta o tamanho do icone e depois volta.',
            child: Exercicio2(),
          ),
          SizedBox(height: 16),
          ExercicioCard(
            titulo: 'Exercicio 3',
            descricao: 'Botao que mostra e esconde texto com AnimatedOpacity.',
            child: Exercicio3(),
          ),
          SizedBox(height: 16),
          ExercicioCard(
            titulo: 'Exercicio 4',
            descricao:
                'Card que comeca pequeno, expande ao clicar e volta ao original.',
            child: Exercicio4(),
          ),
        ],
      ),
    );
  }
}

class ExercicioCard extends StatelessWidget {
  const ExercicioCard({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.child,
  });

  final String titulo;
  final String descricao;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(descricao),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class Exercicio1 extends StatefulWidget {
  const Exercicio1({super.key});

  @override
  State<Exercicio1> createState() => _Exercicio1State();
}

class _Exercicio1State extends State<Exercicio1> {
  bool _animado = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: 180,
          height: _animado ? 180 : 90,
          decoration: BoxDecoration(
            color: _animado ? Colors.amber : Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _animado = !_animado;
            });
          },
          child: const Text('Animar cor e altura'),
        ),
      ],
    );
  }
}

class Exercicio2 extends StatefulWidget {
  const Exercicio2({super.key});

  @override
  State<Exercicio2> createState() => _Exercicio2State();
}

class _Exercicio2State extends State<Exercicio2> {
  double _tamanhoIcone = 48;
  bool _animando = false;

  Future<void> _animarIcone() async {
    if (_animando) {
      return;
    }

    setState(() {
      _animando = true;
      _tamanhoIcone = 108;
    });

    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (!mounted) {
      return;
    }

    setState(() {
      _tamanhoIcone = 48;
      _animando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          width: 160,
          height: 160,
          alignment: Alignment.center,
          child: Icon(
            Icons.star,
            color: Colors.deepOrange,
            size: _tamanhoIcone,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _animarIcone,
          child: const Text('Animar icone'),
        ),
      ],
    );
  }
}

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  bool _visivel = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _visivel ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: const Text(
            'Este texto aparece e desaparec.',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _visivel = !_visivel;
            });
          },
          child: Text(_visivel ? 'Esconder texto' : 'Mostrar texto'),
        ),
      ],
    );
  }
}

class Exercicio4 extends StatefulWidget {
  const Exercicio4({super.key});

  @override
  State<Exercicio4> createState() => _Exercicio4State();
}

class _Exercicio4State extends State<Exercicio4> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandido = !_expandido;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: _expandido ? 180 : 90,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _expandido ? Colors.teal.shade200 : Colors.teal.shade400,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card animado',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _expandido
                  ? 'Toque novamente para voltar ao tamanho original.'
                  : 'Toque para expandir.',
            ),
          ],
        ),
      ),
    );
  }
}
