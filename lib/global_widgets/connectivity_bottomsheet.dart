import 'package:authentication_firebase/global_widgets/standard_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityBottomsheet extends StatelessWidget {
  final String title;
  final String message;

  const ConnectivityBottomsheet({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardBottomsheet(
      title: title,
      message: message,
      primaryButtonText: 'Entendi',
      primaryAction: Get.back,
    );
  }
}
