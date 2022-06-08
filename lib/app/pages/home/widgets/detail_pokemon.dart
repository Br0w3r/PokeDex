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
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: _back().paddingOnly(bottom: 10),
              ),
              _header(context).paddingOnly(left: 10, right: 10),
              Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.85,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _detail(context),
                        _types(context),
                      ],
                    ),
                  ),
                ).paddingOnly(
                  top: MediaQuery.of(context).size.height / 3.80,
                  //bottom: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: _image().paddingOnly(top: 10),
                ),
              ]),
            ],
          ),
        ]),
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
            _title(context, pokemonModel.name.toUpperCase(), 2),
            _type(context),
          ],
        ),
        _subtitle(context, '# ${pokemonModel.id}').paddingOnly(right: 10)
      ],
    );
  }

  Widget _detail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: _subtitle(context, "DETALLE",
              color: Colors.black, bolt: 2, size: 2.8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subtitle(context, 'NOMBRE', color: Colors.black, bolt: 2)
                .paddingOnly(right: 10),
            _subtitle(context, pokemonModel.name.toUpperCase(),
                    color: Colors.black)
                .paddingOnly(left: 10)
          ],
        ).paddingOnly(top: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subtitle(context, 'ALTURA', color: Colors.black, bolt: 2)
                .paddingOnly(right: 10),
            _subtitle(context, '${pokemonModel.height} cm', color: Colors.black)
                .paddingOnly(left: 10)
          ],
        ).paddingOnly(top: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subtitle(context, 'PESO', color: Colors.black, bolt: 2)
                .paddingOnly(right: 10),
            _subtitle(context, '${pokemonModel.weight} kg', color: Colors.black)
                .paddingOnly(left: 10)
          ],
        ).paddingOnly(top: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subtitle(context, 'HABILIDADES', color: Colors.black, bolt: 2)
                .paddingOnly(right: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pokemonModel.abilities
                  .map((e) => _subtitle(
                          context, '${e.ability.name.toUpperCase()},',
                          color: Colors.black)
                      .paddingOnly(top: 10, right: 5))
                  .toList(),
            )
          ],
        ).paddingOnly(top: 15),
      ],
    ).paddingOnly(top: 80, left: 20, right: 20, bottom: 10);
  }

  Widget _types(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: _subtitle(context, "TIPOS",
              color: Colors.black, bolt: 2, size: 2.8),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pokemonModel.types
              .map((e) => _subtitle(context, '${e.type.name.toUpperCase()},',
                      color: Colors.black)
                  .paddingOnly(top: 6, right: 5))
              .toList(),
        ).paddingOnly(top: 5),
      ],
    ).paddingOnly(top: 10, left: 20, right: 20, bottom: 10);
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

  Widget _title(BuildContext context, String title, int bolt,
      {Color color = Colors.white}) {
    return Text(
      title,
      style: Theme.of(context)
          .primaryTextTheme
          .headline2!
          .apply(color: color, fontWeightDelta: bolt),
    ).paddingOnly(left: 10);
  }

  Widget _subtitle(BuildContext context, String subtitle,
      {Color color = Colors.white, int bolt = 0, double size = 0}) {
    return Text(
      subtitle,
      softWrap: true,
      maxLines: 5,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .apply(color: color, fontWeightDelta: bolt, fontSizeDelta: size),
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
