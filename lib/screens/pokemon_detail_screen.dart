import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/pokemon_service.dart';
import 'package:flutter_pokedex/data/webservice.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/widgets/pokemon_details.dart';
// import 'package:flutter_pokedex/models/pokemon.dart';

class PokemonDetailScreen extends StatefulWidget {
  final int id;
  final String name;

  PokemonDetailScreen({Key key, @required this.id, @required this.name})
      : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  Future<Pokemon> pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = Webservice().load(PokemonService.pokemon(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#${widget.id} ${widget.name}'),
      ),
      body: FutureBuilder<Pokemon>(
        future: pokemon,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return PokemonDetails(pokemon: snapshot.data);
        },
      ),
    );
  }
}
