import '../models/pokemon.dart';

abstract class IPokeApiRepository {
  Future<List<Pokemon>> getPokemonList(int offsetCount);
  Future<Pokemon?> getPokemon(String pokemon);
  Future<List<String>> getPokemonEvolutions(int idPokemon);
}
