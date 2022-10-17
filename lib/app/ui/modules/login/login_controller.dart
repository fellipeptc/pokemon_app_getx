import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app_getx/app/data/repositories/i_firebase_repository.dart';
import 'package:pokemon_app_getx/app/services/auth_status.dart';
import 'package:pokemon_app_getx/app/ui/widgets/loader/loader_mixin.dart';
import 'package:pokemon_app_getx/app/ui/widgets/snackbars/snackbar_mixin.dart';
import '../../../routes/app_pages.dart';
import '../../themes/app_colors.dart';

class LoginController extends GetxController with SnackbarMixin, LoaderMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool ptBR = true.obs;
  RxBool enUS = false.obs;
  RxBool loading = false.obs;

  final IFirebaseRepository firebaseRepository;
  LoginController({required this.firebaseRepository});

  @override
  void onInit() {
    loaderListener(loading);
    emailController.text = "test@pokemon.com";
    passwordController.text = "123456";
    _defineLocale();
    super.onInit();
  }

  _defineLocale() {
    final defaultLocale = Platform.localeName;
    if (defaultLocale == 'en_US') {
      ptBR(false);
      enUS(true);
    }
    if (defaultLocale == 'pt_BR') {
      ptBR(true);
      enUS(false);
    }
  }

  createAccount()=> Get.toNamed(AppRoutes.createAccount);

  loginWithEmailPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    bool formValidate = formKey.currentState?.validate() ?? false;
    if (formValidate) {
      loading(true);
      final user = await firebaseRepository.loginUsingEmailPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      loading(false);
      if (user != null) {
        Get.toNamed(AppRoutes.home);
      } else {
        loading(false);
        showSnackBar(
          "Login",
          "Erro ao fazer o login, tente novamente.",
          AppColors.erro,
        );
      }
    }
  }

  resetPassword() async {
    AuthStatus status = await firebaseRepository.resetPassword(email: emailController.text.trim());
    if(status == AuthStatus.successful){
      showSnackBar(
        "RECOVER_MESSAGE_TITLE".tr,
        "RECOVER_MESSAGE".tr,
        AppColors.sucess,
      );
    }
  }
}
