import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/global_widgets/custom_painter.dart';
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
            return CustomPaint(
              painter: StandardPainter(),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 56),
                    children: const [
                      SizedBox(height: 44),
                      LogoSection(),
                      SizedBox(height: 16),
                      SignInSection(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LogoSection extends GetView<SignUpController> {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteSmoke,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 1,
                color: AppColors.blackShadow,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Text('Novo cadastro', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}

class SignInSection extends GetView<SignUpController> {
  const SignInSection({Key? key}) : super(key: key);

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
                      const UsernameField(),
                      const SizedBox(height: 24),
                      const EmailFieldSignUp(),
                      const SizedBox(height: 24),
                      const PasswordFieldSignUp(),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          spacing: 24,
                          runSpacing: 12,
                          children: [
                            ElevatedButton(
                              onPressed: () => Get.offNamed(AuthenticationPage.route),
                              child: Text('Voltar', style: TextStyle(color: Colors.grey[900])),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.white,
                                animationDuration: const Duration(milliseconds: 400),
                              ),
                            ),
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
