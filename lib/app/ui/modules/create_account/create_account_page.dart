import 'package:get/get.dart';
import 'package:pokemon_app_getx/app/ui/modules/create_account/widgets/validate_field_widget.dart';
import 'package:pokemon_app_getx/app/ui/themes/app_text_styles.dart';
import '../../../services/utils.dart';
import '../../themes/app_colors.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/text_form_fields/custom_text_form_field.dart';
import 'create_account_controller.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REGISTER".tr.toUpperCase(),
          style: AppTextStyles.textBoldWhite16.fs(20),
        ),
        centerTitle: true,
      ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "FILL_FIELDS_CREATE_ACCOUNT".tr.capitalizeFirst!,
                          style: AppTextStyles.textBoldBlack16,
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TYPE_EMAIL".tr.capitalizeFirst!,
                                style: AppTextStyles.textNormalBlack14,
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                label: '',
                                textEditingController:
                                    controller.emailController,
                                textInputType: TextInputType.emailAddress,
                                validator: (email) =>
                                    Utils.validateEmail(email),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "TYPE_PASSWORD".tr.capitalizeFirst!,
                                style: AppTextStyles.textNormalBlack14,
                              ),
                              const SizedBox(height: 5),
                              Obx(
                                () => CustomTextField(
                                  label: '',
                                  textInputType: TextInputType.visiblePassword,
                                  textEditingController:
                                      controller.passwordController,
                                  password: controller.passwordObscure.value,
                                  onTapPassword: () =>
                                      controller.passwordObscure.value =
                                          !controller.passwordObscure.value,
                                  onChanged: (password) =>
                                      controller.validatePassword(password),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ValidateFieldWidget(
                                textValidate:
                                    'MINIMUM_CHARACTER'.tr.capitalizeFirst!,
                                validate: controller.minCharacters,
                              ),
                              ValidateFieldWidget(
                                textValidate:
                                    'CONTAINS_UPPERCASE_LETTER'.tr.capitalizeFirst!,
                                validate: controller.containsUppercase,
                              ),
                              ValidateFieldWidget(
                                textValidate:
                                    'CONTAINS_LOWERCASE_LETTER'.tr.capitalizeFirst!,
                                validate: controller.containsLowercase,
                              ),
                              ValidateFieldWidget(
                                textValidate:
                                'CONTAINS_NUMBER'.tr.capitalizeFirst!,
                                validate: controller.containsNumber,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          height: 45,
                          width: double.infinity,
                          borderRadius: 40,
                          title: "CONFIRM".tr.capitalizeFirst!,
                          style: CustomButtonStyle.primary,
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
