import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page.dart';
import 'package:authentication_firebase/modules/sign_up/local_widgets/email_field_sign_up.dart';
import 'package:authentication_firebase/modules/sign_up/local_widgets/password_field_sign_up.dart';
import 'package:authentication_firebase/modules/sign_up/local_widgets/username_field.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  static const route = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Container(
                      height: constraints.maxHeight * 0.64,
                      decoration: BoxDecoration(
                        color: AppColors.greenMarineLight,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 16,
                            spreadRadius: -4,
                            color: AppColors.blackShadow,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: ListView(
                        children: [
                          SizedBox(height: 44),
                          LogoSection(),
                          SizedBox(height: 44),
                          SignInSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class LogoSection extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteSmoke,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 1,
                color: AppColors.blackShadow,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(36),
            child: Text('Logo'),
          ),
        ),
      ),
    );
  }
}

class SignInSection extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteSmoke,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: AppColors.blackShadow,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 30),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Novo cadastro',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      UsernameField(),
                      const SizedBox(height: 24),
                      EmailFieldSignUp(),
                      const SizedBox(height: 24),
                      PasswordFieldSignUp(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.offNamed(AuthenticationPage.route),
                            child: Text('Voltar', style: TextStyle(color: Colors.grey[900])),
                            style: ElevatedButton.styleFrom(primary: AppColors.white),
                          ),
                          const SizedBox(width: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.signUp();
                            },
                            label: const Text('Cadastrar', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                            icon: const Icon(Icons.add, color: AppColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
