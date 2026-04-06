import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonService {
  Future<Pokemon> fetchPokemon(String term) async {
    final Uri url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon/${term.toLowerCase()}',
    );

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      return Pokemon.fromJson(data);
    }

    throw Exception('Pokémon não encontrado.');
  }
}
