import 'package:dio/dio.dart';
import '../models/pokemon.dart';
import '../models/stats.dart';
import 'i_pokeapi_provider.dart';

class PokeApiProvider implements IPokeApiProvider {
  static const String baseUrl = "https://pokeapi.co/api/v2/";
  static const String pokemonsList = "pokemon/?limit=20&offset=";
  static const String pokemonEvolutions = "pokemon-species/";

  @override
  Future<List<Pokemon>> getPokemonList(int offsetCount) async {
    try {
      Response response = await Dio().get("$baseUrl$pokemonsList$offsetCount");
      if (response.statusCode == 200) {
        final List<Pokemon> pokemons = [];
        List data = response.data['results'];
        for (int i = 0; i < data.length; i++) {
          Response responsePokemon = await Dio().get("${data[i]['url']}");
          if (responsePokemon.statusCode == 200) {
            final List<String> typesPokemon = [];
            final List<Stats> statsPokemon = [];

            /// get types from pokemon
            responsePokemon.data['types'].forEach((t) {
              typesPokemon.add(t['type']['name']);
            });

            /// get stats from pokemon
            responsePokemon.data['stats'].forEach((s) {
              Stats stat =
                  Stats(baseStat: s['base_stat'], name: s['stat']['name']);
              statsPokemon.add(stat);
            });

            Pokemon p = Pokemon.fromMapApi(responsePokemon.data);
            p.stats = statsPokemon;
            pokemons.add(p);
          }
        }
        return pokemons;
      }
      return [];
    } on DioError catch (e) {
      print("Erro pokeapi pokemon list -> $e");
      return [];
    }
  }

  @override
  Future<Pokemon?> getPokemon(String pokemon) async {
    final List<Stats> stats = [];
    if (pokemon != "") {
      try {
        Response response = await Dio().get("${baseUrl}pokemon/$pokemon");
        if (response.statusCode == 200) {
          response.data['stats'].forEach((s) {
            Stats stat = Stats(
              baseStat: s['base_stat'],
              name: s['stat']['name'],
            );
            stats.add(stat);
          });
          Pokemon p = Pokemon.fromMapApi(response.data);
          p.stats = stats;
          return p;
        }
        return null;
      } on DioError catch (e) {
        print("Erro pokeapi pokemon -> $e");
        return null;
      }
    }
    return null;
  }

  @override
  Future<List<String>> getPokemonEvolutions(int idPokemon) async {
    final List<String> evolutions = [];
    try {
      Response response =
          await Dio().get("$baseUrl$pokemonEvolutions$idPokemon/");
      if (response.statusCode == 200) {
        String urlEvolutionChain = response.data['evolution_chain']['url'];
        Response responseEvolutionChain = await Dio().get(urlEvolutionChain);
        if (responseEvolutionChain.statusCode == 200) {
          evolutions
              .add(responseEvolutionChain.data['chain']['species']['name']);
          for (Map<String, dynamic> evolution
              in responseEvolutionChain.data['chain']['evolves_to']) {
            evolutions.add(evolution['species']['name']);
            for (Map<String, dynamic> evolution2 in evolution['evolves_to']) {
              evolutions.add(evolution2['species']['name']);
            }
          }
          return evolutions;
        }
      }
      return [];
    } on DioError catch (e) {
      print("Erro pokeapi evolution -> $e");
      return [];
    }
  }
}
