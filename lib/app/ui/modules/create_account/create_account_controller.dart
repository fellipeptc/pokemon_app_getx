import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/i_firebase_repository.dart';
import '../../themes/app_colors.dart';
import '../../widgets/loader/loader_mixin.dart';
import 'package:get/get.dart';

import '../../widgets/snackbars/snackbar_mixin.dart';

class CreateAccountController extends GetxController
    with LoaderMixin, SnackbarMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool passwordObscure = true.obs;
  RxBool loading = false.obs;

  RxBool minCharacters = false.obs;
  RxBool containsLowercase = false.obs;
  RxBool containsUppercase = false.obs;
  RxBool containsNumber = false.obs;

  final IFirebaseRepository firebaseRepository;
  CreateAccountController({required this.firebaseRepository});

  @override
  void onInit() {
    loaderListener(loading);
    super.onInit();
  }

  void validatePassword(String password) {
    /// verify min character
    minCharacters.value = password.length >= 6 ? true : false;

    /// verify uppercase letter
    String uppercase = r'^(?=.*?[A-Z])';
    RegExp regExpUppercase = RegExp(uppercase);
    containsUppercase.value = regExpUppercase.hasMatch(password);

    /// verify lowercase letter
    String lowerCase = r'^(?=.*?[a-z])';
    RegExp regExpLowerCase = RegExp(lowerCase);
    containsLowercase.value = regExpLowerCase.hasMatch(password);

    ///verify if contains numbers
    String number = r'^(?=.*?[0-9])';
    RegExp regExpNumbers = RegExp(number);
    containsNumber.value = regExpNumbers.hasMatch(password);
  }

  createAccount() async {
    bool formValidate = formKey.currentState?.validate() ?? false;
    if (minCharacters.value &&
        containsUppercase.value &&
        containsLowercase.value &&
        containsNumber.value &&
        formValidate) {

      loading(true);
      User? user = await firebaseRepository.createAccount(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      loading(false);

      if (user != null) {
        showSnackBar(
          "CREATE_ACCOUNT_TITLE_MESSAGE".tr,
          "CREATE_ACCOUNT_MESSAGE".tr,
          AppColors.sucess,
        );
      }
    }
  }
}
