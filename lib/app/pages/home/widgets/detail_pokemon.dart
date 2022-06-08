import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/app/pages/home/home.controller.dart';
import 'package:pokedex/data/models/entities/pokemon.model.dart';
import 'package:get/get.dart';

class DetailPokemon extends GetView<HomeController> {
  const DetailPokemon(this.pokemonModel, {Key? key}) : super(key: key);

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectColor(pokemonModel.types.first.type.name),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: _back().paddingOnly(bottom: 10),
            ),
            Container(
              color: Colors.pink,
              child: _header(context),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(),
        ),
      ),
    );
  }

  Widget _back() {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const FaIcon(
        FontAwesomeIcons.arrowLeft,
        color: Colors.white,
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _name(context, pokemonModel.name.toUpperCase()),
            _type(context),
          ],
        ),
        _subtitle(context, '# ${pokemonModel.id}').paddingOnly(right: 10)
      ],
    );
  }

  Widget _image() {
    return SvgPicture.network(
      height: 240,
      pokemonModel.sprites.other!.dreamWorld.frontDefault,
      placeholderBuilder: (BuildContext context) => Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 20),
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[300]!,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _type(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: pokemonModel.types
          .map(
            (e) => Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: _subtitle(context, e.type.name.toUpperCase())
                  .paddingOnly(top: 5, bottom: 5, left: 10, right: 10),
            ),
          )
          .toList(),
    ).paddingOnly(left: 5);
  }

  Widget _name(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .primaryTextTheme
          .headline2!
          .apply(color: Colors.white, fontWeightDelta: 2),
    ).paddingOnly(left: 10);
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
