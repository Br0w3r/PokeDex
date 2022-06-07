import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/pages/home/home.controller.dart';
import 'package:pokedex/app/pages/home/widgets/item_pokemon.dart';
import 'package:pokedex/app/widgets/progress/progress.widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? const ProgressPrimary()
          : Scaffold(
              appBar: AppBar(
                title: Obx(
                  () => Text(
                    "Bienvenido:  ${controller.nameUser.value}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .apply(fontSizeDelta: 2, color: Colors.white),
                  ),
                ),
                actions: [
                  Center(
                    child: const FaIcon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: Colors.white,
                    ).paddingOnly(right: 5),
                  )
                ],
              ),
              body: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _text(context, "Pokedex"),
                  Expanded(child: _listPokemos(context)),
                ],
              )),
            ),
    );
  }

  Widget _text(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .primaryTextTheme
          .headline2!
          .apply(fontWeightDelta: 2),
    ).paddingOnly(left: 15, top: 10);
  }

  Widget _listPokemos(BuildContext context) {
    return GridView.count(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        children:
            controller.pokemon.map((element) => ItemPokemon(element)).toList());
  }
}
