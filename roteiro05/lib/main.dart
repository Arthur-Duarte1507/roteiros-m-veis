import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Roteiro05App());
}

class Roteiro05App extends StatelessWidget {
  const Roteiro05App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roteiro 05',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const Roteiro05Screen(),
    );
  }
}

class Roteiro05Screen extends StatefulWidget {
  const Roteiro05Screen({super.key});

  @override
  State<Roteiro05Screen> createState() => _Roteiro05ScreenState();
}

class _Roteiro05ScreenState extends State<Roteiro05Screen> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  SharedPreferences? _prefs;
  bool _carregando = true;

  List<String> _listaExemplo = <String>[];
  String _ultimaPagina = 'Página A';
  List<String> _itensCarrinho = <String>[];

  static const String _listaKey = 'ex1_lista';
  static const String _ultimaPaginaKey = 'ex3_ultima_pagina';
  static const String _nomeKey = 'ex4_nome';
  static const String _emailKey = 'ex4_email';
  static const String _carrinhoKey = 'ex5_carrinho';

  static const List<String> _produtosFixos = <String>[
    'Produto A',
    'Produto B',
    'Produto C',
  ];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> listaSalva =
        prefs.getStringList(_listaKey) ?? <String>[];
    final List<String> carrinhoSalvo =
        prefs.getStringList(_carrinhoKey) ?? <String>[];
    final String paginaSalva = prefs.getString(_ultimaPaginaKey) ?? 'Página A';

    _nomeController.text = prefs.getString(_nomeKey) ?? '';
    _emailController.text = prefs.getString(_emailKey) ?? '';

    if (!mounted) {
      return;
    }

    setState(() {
      _prefs = prefs;
      _listaExemplo = listaSalva;
      _itensCarrinho = carrinhoSalvo;
      _ultimaPagina = paginaSalva;
      _carregando = false;
    });
  }

  @override
  void dispose() {
    _itemController.dispose();
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _adicionarNaLista() {
    final String texto = _itemController.text.trim();
    if (texto.isEmpty) {
      return;
    }

    setState(() {
      _listaExemplo.add(texto);
      _itemController.clear();
    });

    _prefs?.setStringList(_listaKey, _listaExemplo);
  }

  void _limparTudo() {
    setState(() {
      _listaExemplo.clear();
      _itemController.clear();
    });

    _prefs?.setStringList(_listaKey, _listaExemplo);
  }

  void _selecionarPagina(String pagina) {
    setState(() {
      _ultimaPagina = pagina;
    });

    _prefs?.setString(_ultimaPaginaKey, pagina);
  }

  void _salvarNome(String valor) {
    _prefs?.setString(_nomeKey, valor);
  }

  void _salvarEmail(String valor) {
    _prefs?.setString(_emailKey, valor);
  }

  void _adicionarAoCarrinho(String produto) {
    setState(() {
      _itensCarrinho.add(produto);
    });

    _prefs?.setStringList(_carrinhoKey, _itensCarrinho);
  }

  @override
  Widget build(BuildContext context) {
    if (_carregando) {
      return Scaffold(
        appBar: AppBar(title: const Text('Roteiro 05')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Roteiro 05')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExercicio12(),
            const SizedBox(height: 16),
            _buildExercicio3(context),
            const SizedBox(height: 16),
            _buildExercicio4(),
            const SizedBox(height: 16),
            _buildExercicio5(),
          ],
        ),
      ),
    );
  }

  Widget _buildExercicio12() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Exercícios 1 e 2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                labelText: 'Digite um item',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _adicionarNaLista(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _adicionarNaLista,
                    child: const Text('Adicionar'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _limparTudo,
                    child: const Text('Limpar tudo'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_listaExemplo.isEmpty)
              const Text('Lista vazia.')
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _listaExemplo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(_listaExemplo[index]),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExercicio3(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Exercício 3 - Última ação do usuário',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['Página A', 'Página B', 'Página C'].map((pagina) {
                final bool selecionada = _ultimaPagina == pagina;
                return ElevatedButton(
                  onPressed: () => _selecionarPagina(pagina),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selecionada
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    foregroundColor: selecionada ? Colors.white : null,
                  ),
                  child: Text(pagina),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text('Página atual: $_ultimaPagina'),
          ],
        ),
      ),
    );
  }

  Widget _buildExercicio4() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Exercício 4 - Formulário persistente',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nomeController,
              onChanged: _salvarNome,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              onChanged: _salvarEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExercicio5() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Exercício 5 - Carrinho simples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._produtosFixos.map((produto) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(child: Text(produto)),
                    ElevatedButton(
                      onPressed: () => _adicionarAoCarrinho(produto),
                      child: const Text('Adicionar ao carrinho'),
                    ),
                  ],
                ),
              );
            }),
            const Divider(),
            const Text(
              'Itens adicionados:',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            if (_itensCarrinho.isEmpty)
              const Text('Carrinho vazio.')
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _itensCarrinho.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.shopping_cart_outlined),
                    title: Text(_itensCarrinho[index]),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
