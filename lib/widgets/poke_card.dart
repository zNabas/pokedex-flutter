import 'package:flutter/material.dart';
import 'package:pokedex/helpers/poke_helper.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel? pokemon;
  final Function? onPressed;

  const PokemonCard({
    Key? key,
    this.pokemon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as void Function()?,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              pokemon!.type2 != null
                  ? PokeHelper.getColor(pokemon!.type2!)
                  : PokeHelper.getColor(pokemon!.type1),
              PokeHelper.getColor(pokemon!.type1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                pokemon!.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              pokemon!.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
