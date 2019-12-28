import 'dart:convert';

import 'package:flutter_pokedex/data/webservice.dart';
import 'package:flutter_pokedex/models/api_resource.dart';
import 'package:flutter_pokedex/models/pokemons_paginated.dart';

class PokemonService {
  static Resource<PokemonsPaginated> pokemons(
      {int offset = 0, int limit = 25}) {
    return Resource(
      url: 'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit',
      parse: (response) {
        return PokemonsPaginated.fromJson(json.decode(response.body));
      },
    );
  }

  static Resource<List<APIResource>> pokemonList(
      {int offset = 0, int limit = 25}) {
    return Resource(
      url: 'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit',
      parse: (response) {
        return PokemonsPaginated.fromJson(json.decode(response.body)).results;
      },
    );
  }
}
