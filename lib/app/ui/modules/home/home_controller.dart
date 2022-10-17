import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/pokemon.dart';
import '../../../data/repositories/i_firebase_repository.dart';
import '../../../data/repositories/i_poke_api_reposiory.dart';
import '../../widgets/loader/loader_mixin.dart';

class HomeController extends GetxController with LoaderMixin {
  int offsetCount = 0;
  ScrollController scrollController = ScrollController();
  RxList<Pokemon> listPokemon = <Pokemon>[].obs;
  RxBool loading = true.obs;

  final IPokeApiRepository pokeApiRepository;
  final IFirebaseRepository firebaseRepository;

  HomeController({
    required this.pokeApiRepository,
    required this.firebaseRepository,
  });

  @override
  Future<void> onInit() async {
    loaderListener(loading);
    incrementPokemons();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    loading(true);
    await _getPokemons();
    loading(false);
    super.onReady();
  }

  _getPokemons() async {
    listPokemon.value = await pokeApiRepository.getPokemonList(offsetCount);
  }

  // Ficará escutando os pixels do scroll
  incrementPokemons() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        offsetCount += 20;
        List<Pokemon> addPokemons =
            await pokeApiRepository.getPokemonList(offsetCount);
        listPokemon = listPokemon + addPokemons;
        update(); // atualize GetBuilder a cada vez
      }
    });
  }

  refreshPokemonsList() async {
    await 2.delay();
    offsetCount = 0;
    listPokemon.clear();
    loading(true);
    await _getPokemons();
    loading(false);
  }
}
