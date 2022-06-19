import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const greenMarineLight = Color(0xFF13BDAB);
  static const greenMarineDark = Color(0xFF15B2A1);

  static final red900 = Colors.red.shade900;

  static final grey300 = Colors.grey.shade300;
  static final grey600 = Colors.grey.shade600;
  static final grey900 = Colors.grey.shade900;

  static const black = Colors.black;
  static final blackShadow = Colors.black.withOpacity(0.28);
  static final blackDisabled = Colors.black.withOpacity(0.38);
  static final blackPressedOverlay = Colors.black.withOpacity(0.16);
  static const blackInactive = Colors.black54;
  static final blackMediumEmphasis = Colors.black.withOpacity(0.6);
  static const blackSurface = Color(0xFF202020);

  static const white = Color(0xFFFFFFFF);
  static final whiteDisabled = Colors.white.withOpacity(0.5);
  static final whiteInactive = Colors.white.withOpacity(0.54);
  static const whiteSmoke = Color(0xFFF5F5F5);
}
