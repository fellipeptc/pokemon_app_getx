import 'package:get/get.dart';
import 'package:pokemon_app_getx/app/routes/app_pages.dart';

class SplashController extends GetxController{
  @override
  Future<void> onReady() async {
    await 3.delay();
    goToLoginPage();
    super.onReady();
  }

  goToLoginPage() => Get.offAllNamed(AppRoutes.login);
}