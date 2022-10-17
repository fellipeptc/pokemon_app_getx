import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app_getx/app/ui/modules/login/login_controller.dart';
import 'package:pokemon_app_getx/app/ui/modules/login/widgets/translation_button.dart';
import 'package:pokemon_app_getx/app/ui/widgets/button/custom_button.dart';
import 'package:pokemon_app_getx/app/ui/widgets/text_form_fields/custom_text_form_field.dart';

import '../../../services/utils.dart';
import '../../themes/app_images.dart';
import '../../themes/app_colors.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TranslationButton(
                              title: "EN-US",
                              active: controller.enUS.value,
                              onTap: () {
                                controller.enUS.value = true;
                                controller.ptBR.value = false;
                                Get.updateLocale(const Locale('en', 'US'));
                                controller.formKey.currentState?.validate();
                              },
                            ),
                            const SizedBox(width: 20),
                            TranslationButton(
                              title: "PT-BR",
                              active: controller.ptBR.value,
                              onTap: () {
                                controller.ptBR.value = true;
                                controller.enUS.value = false;
                                Get.updateLocale(const Locale('pt', 'BR'));
                                controller.formKey.currentState?.validate();
                              },
                            ),
                          ],
                        ),
                        Image.asset(
                          AppImages.pokemonLogo,
                          height: 200,
                          width: 200,
                        ),
                        CustomTextField(
                          label: "EMAIL".tr,
                          textEditingController: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (email) => Utils.validateEmail(email),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => CustomTextField(
                            label: "PASSWORD".tr,
                            textInputType: TextInputType.visiblePassword,
                            textEditingController:
                                controller.passwordController,
                            password: controller.passwordObscure.value,
                            onTapPassword: () => controller.passwordObscure
                                .value = !controller.passwordObscure.value,
                            validator: (password) =>
                                Utils.validatePassword(password),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.resetPassword();
                              },
                              child: Text(
                                "FORGOT_PASSWORD".tr,
                                style: const TextStyle(
                                    color: AppColors.primary, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          height: 45,
                          width: double.infinity,
                          borderRadius: 40,
                          title: "LOGIN".tr,
                          style: CustomButtonStyle.primary,
                          onPressed: controller.loginWithEmailPassword,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          height: 45,
                          width: double.infinity,
                          borderRadius: 40,
                          title: "REGISTER".tr,
                          style: CustomButtonStyle.primaryOutline,
                          border: true,
                          onPressed: controller.createAccount,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
