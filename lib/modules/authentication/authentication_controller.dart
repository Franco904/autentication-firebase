import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  late String user;

  @override
  void onInit() {
    user = 'Auth initialized';

    super.onInit();
  }
}
