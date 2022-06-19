import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode signUpEmailFocusNode = FocusNode();
  final FocusNode signUpPasswordFocusNode = FocusNode();

  Future<void> signUp() async {
    await Future.delayed(const Duration(milliseconds: 20));

    formKey.currentState?.save();

    final isFormValid = formKey.currentState?.validate();
    if (isFormValid != null && !isFormValid) return;

    // Sucesso
    Get.offNamed(DonePage.route);
  }
}
