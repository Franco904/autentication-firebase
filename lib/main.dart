import 'package:authentication_firebase/core/theme/color_theme.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page.dart';
import 'package:authentication_firebase/modules/done/done_page.dart';
import 'package:authentication_firebase/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const Authentication());
}

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData.from(colorScheme: createColorScheme()),
      themeMode: ThemeMode.light,
      initialRoute: DonePage.route,
      getPages: getPages(),
    );
  }
}
