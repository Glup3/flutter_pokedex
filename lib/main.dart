import 'package:flutter/material.dart';

import 'package:flutter_pokedex/widgets/pokemon_list.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Pokedex'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: PokemonList(),
        ),
      ),
    );
  }
}
