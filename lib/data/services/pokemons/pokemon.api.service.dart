import 'dart:convert';
import 'package:pokedex/core/values/enviroments.dart';
import 'package:pokedex/data/models/entities/pokemon.model.dart';
import 'package:pokedex/data/models/enums/request_method.enum.dart';
import 'package:pokedex/data/services/base.service.dart';
import 'package:pokedex/data/services/pokemons/pokemon.contract.dart';

class PokemonApiService extends BaseService implements IPokemonService {
  final String _pokemon = Environments.apiPoke;

  @override
  Future<PokemonModel> getPokemonById(int idPokemon) async {
    var userJson = await provider.request<PokemonModel>(
        RequestMethod.get, "${_pokemon}pokemon/$idPokemon",
        useDefaultUrl: false);

    var body = json.decode(userJson.body.toString());

    return PokemonModel.fromJson(body);
  }
}
