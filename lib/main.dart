import 'package:flutter/material.dart';

import 'package:flutter_pokedex/data/pokemon_service.dart';
import 'package:flutter_pokedex/data/webservice.dart';
import 'package:flutter_pokedex/models/pokemons_paginated.dart';
import 'package:flutter_pokedex/widgets/pokemon_list.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<PokemonsPaginated> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = Webservice().load(PokemonService.pokemons(limit: 9));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Pokedex'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: FutureBuilder<PokemonsPaginated>(
            future: _pokemons,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                print('${snapshot.error}');
                return Text('${snapshot.error}');
              }

              return PokemonList(
                pokemons: snapshot.data.results,
              );
            },
          ),
        ),
      ),
    );
  }
}
