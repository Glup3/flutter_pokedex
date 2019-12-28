import 'package:flutter_pokedex/models/api_resource.dart';

class Pokemon {
  final int id;
  final String name;
  final int weight;
  final int baseExperience;
  final List<PokemonType> types;

  Pokemon({this.id, this.name, this.weight, this.baseExperience, this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<dynamic> t = json['types'];

    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
      baseExperience: json['base_experience'],
      types: t.map((dynamic type) => PokemonType.fromJson(type)).toList(),
    );
  }
}

class PokemonType {
  final int slot;
  final APIResource type;

  PokemonType({this.slot, this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: APIResource.fromJson(json['type']),
    );
  }
}
