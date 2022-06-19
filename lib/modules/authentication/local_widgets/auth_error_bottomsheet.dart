import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page_controller.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthErrorBottomsheet extends GetView<AuthenticationPageController> {
  const AuthErrorBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      height: 220,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Erro na autenticação', style: TextStyle(fontSize: 22)),
          const SizedBox(height: 24),
          Text(controller.errorMessage.value, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Get.offAllNamed(SignUpPage.route),
                child: Text('Criar uma conta', style: TextStyle(color: Colors.grey[900])),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.white,
                  animationDuration: const Duration(milliseconds: 400),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: Get.back,
                child: const Text('Entendi', style: TextStyle(color: AppColors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.greenMarineLight)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
