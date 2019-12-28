import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/utils/string_utils.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: FadeInImage.memoryNetwork(
              imageScale: 0.5,
              placeholder: kTransparentImage,
              height: 200,
              width: 200,
              image:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${capitalizeFirstCharacter(pokemon.name)}',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Row(
                children: pokemon.types
                    .map((type) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Text(capitalizeFirstCharacter(type.type.name)),
                        ))
                    .toList(),
              ),
            ],
          ),
          Text('Weight: ${pokemon.weight}'),
          Text('Base Experience: ${pokemon.baseExperience}'),
        ],
      ),
    );
  }
}
