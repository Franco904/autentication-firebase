import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  static FirebaseAuth get auth => FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? get currentUser => auth.currentUser;
  final RxBool authTried = false.obs;

  @override
  Future<void> onInit() async {
    if (currentUser != null) await finishSession();

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null && authTried.value) {
          debugPrint('Usuário não encontrado.');
        } else if (user != null) {
          debugPrint('Usuário foi autenticado: ${user.email}');
        }
      },
    );

    super.onInit();
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  Future<AuthCredential?> signInWithGoogle() async {
    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final googleSignInAuthentication = await googleSignInAccount.authentication;

      // Recupera as credenciais do usuário de conta Google
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return credential;
    }
    return null;
  }

  Future<UserCredential> signUpUser(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  Future<void> updateUsername(User user, String username) async {
    await user.updateDisplayName(username.trim());
  }

  Future<void> finishSession() async {
    if (!kIsWeb) await googleSignIn.signOut();

    await auth.signOut();
  }
}
