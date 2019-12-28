import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_pokedex/data/pokemon_service.dart';
import 'package:flutter_pokedex/data/webservice.dart';

import 'package:flutter_pokedex/models/api_resource.dart';
import 'package:flutter_pokedex/widgets/pokemon_list_tile.dart';

class PokemonList extends StatelessWidget {
  static const int LIMIT = 25;
  final List<APIResource> pokemons;

  PokemonList({Key key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagewiseListView(
      pageSize: LIMIT,
      pageFuture: (pageIndex) => Webservice().load(
          PokemonService.pokemonList(limit: LIMIT, offset: LIMIT * pageIndex)),
      itemBuilder: (context, pokemon, index) {
        return PokemonListTile(pokemon: pokemon);
      },
    );
  }
}
