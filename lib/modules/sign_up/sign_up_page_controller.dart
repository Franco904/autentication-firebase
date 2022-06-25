import 'package:authentication_firebase/core/controllers/auth_controller.dart';
import 'package:authentication_firebase/core/util/connectivity.dart';
import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:authentication_firebase/modules/sign_up/local_widgets/sign_up_error_bottomsheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  final AuthController authController = AuthController.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  final RxString signUpUsername = ''.obs;
  final RxString signUpEmail = ''.obs;
  final RxString signUpPassword = ''.obs;
  final RxString errorMessage = ''.obs;

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode signUpEmailFocusNode = FocusNode();
  final FocusNode signUpPasswordFocusNode = FocusNode();

  Future<void> signUp() async {
    if (!await checkInternet() || authController.currentUser != null) return;

    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 20));
    formKey.currentState?.save();

    final isFormValid = formKey.currentState?.validate();
    if (isFormValid != null && !isFormValid) {
      isLoading.value = false;
      return;
    }

    await createUser();
  }

  Future<void> createUser() async {
    try {
      final credential = await authController.signUpUser(signUpEmail.value, signUpPassword.value);
      if (credential.user != null) {
        await authController.updateUsername(credential.user!, signUpUsername.value);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage.value = 'Este email já está registrado.';
          break;

        default:
          errorMessage.value = 'Algum erro inesperado ocorreu durante o registro.';
          debugPrint(e.code);
          break;
      }
      isLoading.value = false;
      return Get.bottomSheet(const SignUpErrorBottomsheet());
    }
    isLoading.value = false;

    Get.offAllNamed(DonePage.route);
  }
}
