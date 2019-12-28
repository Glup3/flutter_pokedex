import 'package:flutter/material.dart';
// import 'package:flutter_pokedex/models/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final int id;

  PokemonDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: Container(
        child: Text('$id'),
      ),
    );
  }
}
