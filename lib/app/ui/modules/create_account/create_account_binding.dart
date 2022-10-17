import 'package:get/get.dart';
import '../../../data/providers/i_pokeapi_provider.dart';
import '../../../data/providers/pokeapi_provider.dart';
import '../../../data/repositories/i_poke_api_reposiory.dart';
import '../../../data/repositories/poke_api_repository.dart';
import 'create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    //Provider
    Get.lazyPut<IPokeApiProvider>(() => PokeApiProvider());
    //Repository
    Get.lazyPut<IPokeApiRepository>(
            () => PokeApiRepository(pokeApiProvider: Get.find()));
    //Controller
    Get.put(CreateAccountController(firebaseRepository: Get.find()));
  }
}
