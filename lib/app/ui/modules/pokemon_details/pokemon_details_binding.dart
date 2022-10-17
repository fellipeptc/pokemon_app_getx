import 'package:get/get.dart';
import '../../../data/providers/firebase_provider.dart';
import '../../../data/providers/i_firebase_provider.dart';
import '../../../data/providers/i_pokeapi_provider.dart';
import '../../../data/providers/pokeapi_provider.dart';
import '../../../data/repositories/firebase_repository.dart';
import '../../../data/repositories/i_firebase_repository.dart';
import '../../../data/repositories/i_poke_api_reposiory.dart';
import '../../../data/repositories/poke_api_repository.dart';
import 'pokemon_details_controller.dart';

class PokemonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    //Provider
    Get.lazyPut<IPokeApiProvider>(() => PokeApiProvider());
    Get.lazyPut<IFirebaseProvider>(() => FirebaseProvider());
    //Repository
    Get.lazyPut<IPokeApiRepository>(
        () => PokeApiRepository(pokeApiProvider: Get.find()));
    Get.lazyPut<IFirebaseRepository>(
        () => FirebaseRepository(firebaseProvider: Get.find()));
    //Controller
    Get.put(PokemonDetailsController(
        pokeApiRepository: Get.find(), firebaseRepository: Get.find()));
  }
}
