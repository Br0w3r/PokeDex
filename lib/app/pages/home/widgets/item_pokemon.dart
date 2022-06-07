import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/app/pages/home/home.controller.dart';
import 'package:pokedex/data/models/entities/pokemon.model.dart';
import 'package:get/get.dart';

class ItemPokemon extends GetView<HomeController> {
  const ItemPokemon(this.pokemonModel, {Key? key}) : super(key: key);

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _selectColor(pokemonModel.types.first.type.name),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: _title(context, '#${pokemonModel.id}')),
          _title(context, pokemonModel.name.toUpperCase()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  children: pokemonModel.types
                      .map(
                        (e) => Card(
                          color: Colors.transparent,
                          child: _subtitle(context, e.type.name.toUpperCase())
                              .paddingAll(3),
                        ),
                      )
                      .toList()),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.network(
                    height: 80,
                    pokemonModel.sprites.other!.dreamWorld.frontDefault,
                    placeholderBuilder: (BuildContext context) => Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[300]!,
                        color: Colors.white,
                      ),
                    ),
                  ).paddingOnly(top: 10),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(10),
    );
  }

  Widget _title(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2!.apply(color: Colors.white),
    );
  }

  Widget _subtitle(BuildContext context, String subtitle) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.bodyText2!.apply(color: Colors.white),
    );
  }

  Color _selectColor(String data) {
    Color color = Colors.teal;
    switch (data) {
      case 'bug':
        color = Colors.green[300]!;
        break;
      case 'water':
        color = Colors.lightBlue[300]!;
        break;
      case 'grass':
        color = Colors.teal[200]!;
        break;
      case 'fire':
        color = Colors.red[300]!;
        break;
      case 'normal':
        color = Colors.grey[400]!;
        break;
      case 'poison':
        color = Colors.purple[300]!;
        break;
      case 'electric':
        color = Colors.yellowAccent[400]!;
        break;
      case 'ground':
        color = Colors.brown[200]!;
        break;
      case 'fairy':
        color = Colors.pink[300]!;
        break;
      case 'fighting':
        color = Colors.orangeAccent[400]!;
        break;
      case 'psychic':
        color = Colors.purple[200]!;
        break;
      case 'rock':
        color = Colors.brown[400]!;
        break;
      case 'ghost':
        color = Colors.blueGrey[600]!;
        break;
      case 'dragon':
        color = Colors.deepOrange;
        break;
    }

    return color;
  }
}
