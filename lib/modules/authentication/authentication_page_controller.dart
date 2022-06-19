import 'package:authentication_firebase/core/controllers/auth_controller.dart';
import 'package:authentication_firebase/global_widgets/connectivity_bottomsheet.dart';
import 'package:authentication_firebase/modules/authentication/local_widgets/auth_error_bottomsheet.dart';
import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationPageController extends GetxController {
  final AuthController authController = AuthController.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString authEmail = ''.obs;
  final RxString authPassword = ''.obs;
  final RxString errorMessage = ''.obs;

  final FocusNode authEmailFocusNode = FocusNode();
  final FocusNode authPasswordFocusNode = FocusNode();

  Future<void> signIn() async {
    await Future.delayed(const Duration(milliseconds: 20));
    formKey.currentState?.save();

    final isFormValid = formKey.currentState?.validate();
    if (isFormValid != null && !isFormValid) return;

    await fetchUser();
  }

  Future<void> fetchUser() async {
    authController.authTried.value = true;

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Get.bottomSheet(const ConnectivityBottomsheet(
        title: 'Conexão perdida',
        message: 'Houve um problema na conexão com a sua internet e a autenticação não pode ser realizada.',
      ));
    }

    try {
      await authController.signInWithEmailAndPassword(authEmail.value, authPassword.value);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          errorMessage.value = 'Usuário e/ou senha incorretos.';
          break;

        default:
          errorMessage.value = 'Ops! Algum erro inesperado ocorreu.';
          debugPrint(e.code);
          break;
      }

      return Get.bottomSheet(const AuthErrorBottomsheet());
    }

    Get.offNamed(DonePage.route);
  }
}
