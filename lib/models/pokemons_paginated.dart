import 'package:flutter_pokedex/models/api_resource.dart';

class PokemonsPaginated {
  final int count;
  final String next;
  final String previous;
  final List<APIResource> results;

  PokemonsPaginated({this.count, this.next, this.previous, this.results});

  factory PokemonsPaginated.fromJson(Map<String, dynamic> json) {
    List<dynamic> l = json['results'];

    print(l);

    return PokemonsPaginated(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          l.map((dynamic resource) => APIResource.fromJson(resource)).toList(),
    );
  }
}
