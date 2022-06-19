import 'package:authentication_firebase/modules/authentication/authentication_page_controller.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page.dart';
import 'package:authentication_firebase/modules/done/done_page_controller.dart';
import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page_controller.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages() {
  return [
    GetPage<void>(
      name: AuthenticationPage.route,
      page: () => const AuthenticationPage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<AuthenticationPageController>(() => AuthenticationPageController())),
    ),
    GetPage<void>(
      name: SignUpPage.route,
      page: () => const SignUpPage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<SignUpPageController>(() => SignUpPageController())),
    ),
    GetPage<void>(
      name: DonePage.route,
      page: () => const DonePage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<DonePageController>(() => DonePageController())),
    ),
  ];
}
