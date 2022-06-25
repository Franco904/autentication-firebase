import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/global_widgets/standard_painter.dart';
import 'package:authentication_firebase/modules/done/done_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonePage extends GetView<DonePageController> {
  static const route = '/done';

  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      body: CustomPaint(
        painter: StandardPainter(),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteSmoke,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: AppColors.blackShadow,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_outline, color: AppColors.greenMarineLight),
                  const SizedBox(height: 24),
                  const Text('Entrada realizada com sucesso', style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  Text('Boas-vindas ${controller.authController.currentUser?.displayName ?? 'Fulano'}!',
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  if (controller.userPhoto.isNotEmpty) ...[
                    ClipOval(
                      child: Image.network(
                        controller.userPhoto,
                        fit: BoxFit.fitHeight,
                        scale: 1.75,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  ElevatedButton(
                    onPressed: controller.finishCurrentSession,
                    child: Text('Encerrar sessão', style: TextStyle(color: Colors.grey[900])),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      animationDuration: const Duration(milliseconds: 400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
