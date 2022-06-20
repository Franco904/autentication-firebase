import 'package:authentication_firebase/global_widgets/connectivity_bottomsheet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

Future<bool> checkInternet() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    Get.bottomSheet(const ConnectivityBottomsheet(
      title: 'Conexão perdida',
      message: 'Houve um problema na conexão com a sua internet e a autenticação não pode ser realizada.',
    ));

    return false;
  }
  return true;
}
