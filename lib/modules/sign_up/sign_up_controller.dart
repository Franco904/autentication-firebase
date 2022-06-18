import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameFocusNode = FocusNode();
  final signUpEmailFocusNode = FocusNode();
  final signUpPasswordFocusNode = FocusNode();

  Future<void> signUp() async {
    await Future.delayed(const Duration(milliseconds: 20));

    formKey.currentState?.save();

    final isFormValid = formKey.currentState?.validate();
    if (isFormValid != null && !isFormValid) return;

    // Sucesso
    Get.offNamed(DonePage.route);
  }
}
