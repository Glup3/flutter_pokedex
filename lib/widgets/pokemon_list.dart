import 'package:flutter/material.dart';

import 'package:flutter_pokedex/models/api_resource.dart';
import 'package:flutter_pokedex/widgets/pokemon_list_tile.dart';

class PokemonList extends StatelessWidget {
  final List<APIResource> pokemons;

  PokemonList({Key key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: pokemons
          .map((APIResource pokemon) => PokemonListTile(pokemon: pokemon))
          .toList(),
    );
  }
}
