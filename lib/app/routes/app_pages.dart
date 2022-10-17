import '../ui/modules/create_account/create_account_binding.dart';
import '../ui/modules/create_account/create_account_page.dart';
import '../ui/modules/home/home_binding.dart';
import '../ui/modules/home/home_page.dart';
import '../ui/modules/login/login_binding.dart';
import '../ui/modules/login/login_page.dart';
import '../ui/modules/pokemon_details/pokemon_details_binding.dart';
import '../ui/modules/pokemon_details/pokemon_details_page.dart';
import '../ui/modules/splash/splash_binding.dart';
import '../ui/modules/splash/splash_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    //SPLASH PAGE
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    //LOGIN PAGE
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    //CREATE ACCOUNT PAGE
    GetPage(
      name: AppRoutes.createAccount,
      page: () => const CreateAccountPage(),
      binding: CreateAccountBinding(),
    ),

    //HOME PAGE
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    //POKEMON DETAILS PAGE
    GetPage(
      name: AppRoutes.pokemonDetails,
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsBinding(),
    ),
  ];
}
