import 'package:authentication_firebase/core/controllers/auth_controller.dart';
import 'package:authentication_firebase/core/enums.dart';
import 'package:authentication_firebase/core/util/connectivity.dart';
import 'package:authentication_firebase/modules/authentication/local_widgets/auth_error_bottomsheet.dart';
import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationPageController extends GetxController {
  final AuthController authController = AuthController.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxBool authFailed = false.obs;
  final Rx<SignInMethod> currentSignInMethod = Rx<SignInMethod>(SignInMethod.none);

  final RxString authEmail = ''.obs;
  final RxString authPassword = ''.obs;
  final RxString errorMessage = ''.obs;

  final FocusNode authEmailFocusNode = FocusNode();
  final FocusNode authPasswordFocusNode = FocusNode();

  Future<void> signIn(SignInMethod signInMethod) async {
    if (!await checkInternet() || authController.currentUser != null) return;

    currentSignInMethod.value = signInMethod;
    authController.authTried.value = true;

    switch (signInMethod) {
      case SignInMethod.emailAndPassword:
        isLoading.value = true;

        await Future.delayed(const Duration(milliseconds: 20));
        formKey.currentState?.save();

        final isFormValid = formKey.currentState?.validate();
        if (isFormValid != null && !isFormValid) {
          isLoading.value = false;
          return;
        }

        await fetchUserEmailPassword();
        break;

      case SignInMethod.google:
        await fetchUserGoogle();
        break;

      case SignInMethod.github:
        await fetchUserGitHub();
        break;

      default:
        authFailed.value = true;
        errorMessage.value = 'Algum erro inesperado ocorreu durante a autenticação.';
        break;
    }

    isLoading.value = false;
    if (authFailed.value) {
      Get.bottomSheet(const AuthErrorBottomsheet());
    } else {
      Get.offAllNamed(DonePage.route);
    }
  }

  Future<void> fetchUserEmailPassword() async {
    try {
      final res = await authController.signInWithEmailAndPassword(authEmail.value, authPassword.value);
      debugPrint('AAA: $res');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          errorMessage.value = 'Usuário e/ou senha incorretos.';
          break;

        default:
          errorMessage.value = 'Algum erro inesperado ocorreu durante a autenticação.';
          break;
      }
      authFailed.value = true;
      return;
    }
    authFailed.value = false;
  }

  Future<void> fetchUserGoogle() async {
    try {
      final credential = await authController.signInWithGoogle();
      if (credential == null) {
        authFailed.value = true;
        errorMessage.value = 'Falha ao recuperar credencial.';
        return;
      }
      await authController.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      switch (e.code) {
        case 'account-exists-with-different-credential':
        case 'invalid-credential':
          errorMessage.value = 'Usuário e/ou senha incorretos.';
          break;

        default:
          errorMessage.value = 'Algum erro inesperado ocorreu durante a autenticação.';
          break;
      }
      authFailed.value = true;
      return;
    }
    authFailed.value = false;
  }

  Future<void> fetchUserGitHub() async {}
}
