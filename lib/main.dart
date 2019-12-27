import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemons_paginated.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<PokemonsPaginated> pokemons;

  @override
  void initState() {
    super.initState();
    pokemons = fetchPokemons();
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
            future: pokemons,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                print('${snapshot.error}');
                return Text('${snapshot.error}');
              }

              return Text('${snapshot.data.count}');
            },
          ),
        ),
      ),
    );
  }
}

Future<PokemonsPaginated> fetchPokemons() async {
  final response = await http.get('https://pokeapi.co/api/v2/pokemon');

  if (response.statusCode == 200) {
    return PokemonsPaginated.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Pokemons');
  }
}
