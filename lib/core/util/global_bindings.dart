import 'package:authentication_firebase/core/controllers/auth_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() => Get.put<AuthController>(AuthController(), permanent: true);
}
