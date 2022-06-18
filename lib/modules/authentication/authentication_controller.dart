import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final authEmailFocusNode = FocusNode();
  final authPasswordFocusNode = FocusNode();

  final isLoggedIn = false.obs;

  Future<void> signIn() async {
    await Future.delayed(const Duration(milliseconds: 20));

    formKey.currentState?.save();

    final isFormValid = formKey.currentState?.validate();
    if (isFormValid != null && !isFormValid) return;

    // Sucesso
    Get.offNamed(DonePage.route);
  }
}
