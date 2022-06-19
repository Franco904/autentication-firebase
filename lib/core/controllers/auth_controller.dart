import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  static FirebaseAuth get auth => FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;
  final RxBool authTried = false.obs;

  @override
  Future<void> onInit() async {
    await finishSession();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null && authTried.value) {
          debugPrint('Usuário não encontrado.');
        } else if (user != null) {
          debugPrint('Usuário foi autenticado: ${user.displayName} - ${user.email}');
        }
      },
    );

    super.onInit();
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> finishSession() async {
    await auth.signOut();
  }
}
