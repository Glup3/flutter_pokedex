import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/pokemons_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PokemonsScreen(),
    );
  }
}
