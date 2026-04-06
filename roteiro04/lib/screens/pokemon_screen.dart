import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokemon_service.dart';
import 'mensagem_lifecycle_screen.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _controller = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final PokemonService _pokemonService = PokemonService();

  Pokemon? pokemon;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    searchPokemon('25');
  }

  Future<void> searchPokemon(String term) async {
    final String query = term.trim();
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final Pokemon fetchedPokemon = await _pokemonService.fetchPokemon(query);
      if (!mounted) {
        return;
      }

      setState(() {
        pokemon = fetchedPokemon;
        isLoading = false;
        _controller.text = fetchedPokemon.id.toString();
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        pokemon = null;
        isLoading = false;
        errorMessage = 'Erro ao buscar Pokémon.';
      });
    }
  }

  Future<void> playCry() async {
    final String? cryUrl = pokemon?.cryUrl;
    if (cryUrl == null || cryUrl.isEmpty) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Som não disponível para este Pokémon.')),
      );
      return;
    }

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(cryUrl));
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível tocar o som.')),
      );
    }
  }

  String formatName(String text) {
    if (text.isEmpty) {
      return text;
    }
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon? currentPokemon = pokemon;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex com API'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MensagemLifecycleScreen(),
                ),
              );
            },
            icon: const Icon(Icons.message_outlined),
            tooltip: 'Abrir atividade lifecycle',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome ou número do Pokémon',
                border: OutlineInputBorder(),
              ),
              onSubmitted: searchPokemon,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => searchPokemon(_controller.text),
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            if (isLoading) ...[
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 16),
            ],
            if (errorMessage.isNotEmpty) ...[
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (currentPokemon != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        formatName(currentPokemon.name),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Nº ${currentPokemon.id}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      if (currentPokemon.imageUrl.isNotEmpty)
                        Image.network(
                          currentPokemon.imageUrl,
                          height: 220,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text('Imagem indisponível');
                          },
                        )
                      else
                        const Text('Imagem indisponível'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: playCry,
                        child: const Text('Tocar som'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: currentPokemon.id > 1
                                  ? () => searchPokemon(
                                      (currentPokemon.id - 1).toString(),
                                    )
                                  : null,
                              child: const Text('Anterior'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => searchPokemon(
                                (currentPokemon.id + 1).toString(),
                              ),
                              child: const Text('Próximo'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
