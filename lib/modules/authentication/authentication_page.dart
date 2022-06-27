import 'package:authentication_firebase/core/enums.dart';
import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/global_widgets/standard_painter.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page_controller.dart';
import 'package:authentication_firebase/modules/authentication/local_widgets/email_field_auth.dart';
import 'package:authentication_firebase/modules/authentication/local_widgets/password_field_auth.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AuthenticationPage extends GetView<AuthenticationPageController> {
  static const route = '/auth';

  const AuthenticationPage({Key? key}) : super(key: key);

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
                      SizedBox(height: 8),
                      AuthSection(),
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

class LogoSection extends GetView<AuthenticationPageController> {
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
            child: Text('Autenticação', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}

class AuthSection extends GetView<AuthenticationPageController> {
  const AuthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
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
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const EmailFieldAuth(),
                      const SizedBox(height: 24),
                      const PasswordFieldAuth(),
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          Obx(
                            () => AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: controller.isLoading.value && controller.currentSignInMethod.value == SignInMethod.emailAndPassword
                                  ? Transform.scale(
                                      scale: 0.75,
                                      child: const CircularProgressIndicator(),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          controller.signIn(SignInMethod.emailAndPassword);
                                        },
                                        child: const Text('Entrar', style: TextStyle(color: AppColors.white)),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.greenMarineLight)),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () => Get.offNamed(SignUpPage.route),
                              child: Text('Não tenho conta', style: TextStyle(color: Colors.grey[900])),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.white,
                                animationDuration: const Duration(milliseconds: 400),
                              ),
                            ),
                          ),
                          SizedBox(height: 24, child: Divider(color: AppColors.grey500)),
                          Obx(
                            () => AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: controller.isLoading.value && controller.currentSignInMethod.value == SignInMethod.google
                                  ? Transform.scale(
                                      scale: 0.75,
                                      child: const CircularProgressIndicator(),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton.icon(
                                        onPressed: () => controller.signIn(SignInMethod.google),
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: FaIcon(FontAwesomeIcons.google, color: AppColors.greenMarineLight, size: 16),
                                        ),
                                        label: Text('Entrar com Google', style: TextStyle(color: Colors.grey[900])),
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.white,
                                          animationDuration: const Duration(milliseconds: 400),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Obx(
                            () => AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: controller.isLoading.value && controller.currentSignInMethod.value == SignInMethod.github
                                  ? Transform.scale(
                                      scale: 0.75,
                                      child: const CircularProgressIndicator(),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Get.rawSnackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            duration: const Duration(seconds: 2),
                                            borderRadius: 8,
                                            backgroundColor: AppColors.blackSurface,
                                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                                            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                                            messageText: Text('Em desenvolvimento',
                                                style: Get.theme.textTheme.caption!.copyWith(color: Colors.white, fontSize: 16)),
                                          );

                                          // controller.signIn(SignInMethod.github);
                                        },
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: FaIcon(FontAwesomeIcons.github, color: AppColors.greenMarineLight, size: 16),
                                        ),
                                        label: Text('Entrar com GitHub', style: TextStyle(color: Colors.grey[900])),
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.white,
                                          animationDuration: const Duration(milliseconds: 400),
                                        ),
                                      ),
                                    ),
                            ),
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
