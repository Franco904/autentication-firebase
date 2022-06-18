import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StandardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));

    final paintOne = Paint();
    paintOne.color = AppColors.greenMarineLight;

    canvas.drawPath(mainBackground, paintOne);

    final ovalPath = Path()

      // Começa em 15% abaixo da altura total da página
      ..moveTo(0, height * 0.15)

      // Pinta a curva do ponto atual até o meio da página (x2, y2)
      ..quadraticBezierTo(width * 0.45, height * 0.25, width * 0.5, height * 0.5)

      // Continua a curva do ponto atual até o lado inferior esquerdo (10% width)
      ..quadraticBezierTo(width * 0.55, height * 0.8, width * 0.1, height)

      // Completa linha final para esquerda e fecha o trajeto com close()
      ..lineTo(0, height)
      ..close();

    final paintTwo = Paint();
    paintTwo.color = AppColors.greenMarineDark;

    canvas.drawPath(ovalPath, paintTwo);
  }

  @override
  bool shouldRepaint(StandardPainter oldDelegate) => oldDelegate != this;

  @override
  bool shouldRebuildSemantics(StandardPainter oldDelegate) => oldDelegate != this;
}
