import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app_getx/app/ui/themes/app_colors.dart';
import '../../../data/models/pokemon.dart';
import '../../../data/models/types_pokemon.dart';
import '../../../data/repositories/i_firebase_repository.dart';
import '../../../data/repositories/i_poke_api_reposiory.dart';
import '../../widgets/snackbars/snackbar_mixin.dart';

class PokemonDetailsController extends GetxController with SnackbarMixin {
  /// Pokemon select on previous page
  late Pokemon pokemon = Get.arguments;

  ///interface variables
  late Color backColor = TypesPokemon.backColor(pokemon.primaryType!);
  late Color textColor = TypesPokemon.textColor(pokemon.primaryType!);
  late List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;

  RxList<Pokemon> pokemonEvolutions = <Pokemon>[].obs;
  RxInt initialPage = 0.obs;
  RxInt activeIndex = 0.obs;
  RxBool loading = true.obs;

  final IFirebaseRepository firebaseRepository;
  final IPokeApiRepository pokeApiRepository;

  PokemonDetailsController({
    required this.pokeApiRepository,
    required this.firebaseRepository,
  });

  @override
  Future<void> onInit() async {
    loading(true);
    await _getEvolutionsPokemon();
    _setCarouselPosition();
    loading(false);
    super.onInit();
  }

  savePokemon() async {
    await firebaseRepository.savePokemon(pokemon: pokemon);
    final documentId = await firebaseRepository.readPokemon(pokemon: pokemon);
    if (documentId != null) {
      showSnackBar(
        "FireStore - ${pokemon.name!.capitalizeFirst!}",
        "SUCCESS_SAVE_MESSAGE".tr.capitalizeFirst!,
        AppColors.sucess,
      );
    } else {
      showSnackBar(
        "FireStore - ${pokemon.name!.capitalizeFirst!}",
        "ERROR_SAVE_MESSAGE".tr.capitalizeFirst!,
        AppColors.erro,
      );
    }
  }

  _getEvolutionsPokemon() async {
    List<String> pokemonsName =
        await pokeApiRepository.getPokemonEvolutions(pokemon.position!);
    for (var name in pokemonsName) {
      Pokemon? p = await pokeApiRepository.getPokemon(name);
      if (p != null) pokemonEvolutions.add(p);
    }
  }

  _setCarouselPosition() {
    initialPage.value = pokemonEvolutions.indexWhere(
      (element) => element.name == pokemon.name,
    );
    activeIndex.value = initialPage.value;
  }
}
