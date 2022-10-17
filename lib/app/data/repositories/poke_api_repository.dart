
import '../models/pokemon.dart';
import '../providers/i_pokeapi_provider.dart';
import 'i_poke_api_reposiory.dart';

class PokeApiRepository implements IPokeApiRepository {
  final IPokeApiProvider pokeApiProvider;

  PokeApiRepository({required this.pokeApiProvider});

  @override
  Future<List<Pokemon>> getPokemonList(int offsetCount) async {
    return await pokeApiProvider.getPokemonList(offsetCount);
  }

  @override
  Future<Pokemon?> getPokemon(String pokemon) async {
    return await pokeApiProvider.getPokemon(pokemon);
  }

  @override
  Future<List<String>> getPokemonEvolutions(int idPokemon) async {
    return await pokeApiProvider.getPokemonEvolutions(idPokemon);
  }
}
