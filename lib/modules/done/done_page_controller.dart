import 'package:authentication_firebase/core/controllers/auth_controller.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page.dart';
import 'package:get/get.dart';

class DonePageController extends GetxController {
  final AuthController authController = AuthController.instance;

  void finishCurrentSession() {
    authController.finishSession();
    authController.authTried.value = false;

    Get.offNamed(AuthenticationPage.route);
  }
}
