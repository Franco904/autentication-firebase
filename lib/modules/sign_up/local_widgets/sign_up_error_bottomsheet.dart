import 'package:authentication_firebase/global_widgets/standard_bottomsheet.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpErrorBottomsheet extends GetView<SignUpPageController> {
  const SignUpErrorBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardBottomsheet(
      title: 'Erro no registro',
      message: controller.errorMessage.value,
      primaryButtonText: 'Entendi',
      primaryAction: Get.back,
    );
  }
}
