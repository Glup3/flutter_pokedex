import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/api_resource.dart';
import 'package:flutter_pokedex/screens/pokemon_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonListTile extends StatelessWidget {
  final APIResource pokemon;

  PokemonListTile({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = getIDFromURL(pokemon.url);

    return Material(
      color: id % 2 == 0 ? Colors.blue[200] : Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonDetailScreen(id: id)),
          );
        },
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
          ),
          title: Text('#$id ${capitalizeFirstCharacter(pokemon.name)}'),
        ),
      ),
    );
  }
}

int getIDFromURL(String url) {
  List<String> parts = url.split('/');

  return int.parse(parts[parts.length - 2]);
}

String capitalizeFirstCharacter(String s) {
  return '${s[0].toUpperCase()}${s.substring(1)}';
}
