import 'package:authentication_firebase/modules/authentication/authentication_controller.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages() {
  return [
    GetPage<void>(
      name: AuthenticationPage.route,
      page: () => const AuthenticationPage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<AuthenticationController>(() => AuthenticationController())),
    ),
  ];
}
