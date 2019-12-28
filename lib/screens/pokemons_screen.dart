import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/pokemon_list.dart';

class PokemonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Pokedex'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: PokemonList(),
      ),
    );
  }
}
