import '../models/pokemon.dart';

abstract class IPokeApiProvider {
  Future<List<Pokemon>> getPokemonList(int offsetCount);
  Future<Pokemon?> getPokemon(String pokemon);
  Future<List<String>> getPokemonEvolutions(int idPokemon);
}