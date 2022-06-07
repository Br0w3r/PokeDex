import 'package:pokedex/data/models/entities/pokemon.model.dart';

abstract class IPokemonService {
  Future<PokemonModel> getPokemonById(int type);
}
