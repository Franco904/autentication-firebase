import 'package:authentication_firebase/global_widgets/standard_bottomsheet.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page_controller.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthErrorBottomsheet extends GetView<AuthenticationPageController> {
  const AuthErrorBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardBottomsheet(
      title: 'Erro na autenticação',
      message: controller.errorMessage.value,
      primaryButtonText: 'Entendi',
      primaryAction: Get.back,
      secondaryButtonText: 'Criar uma conta',
      secondaryAction: () => Get.offAllNamed(SignUpPage.route),
    );
  }
}
