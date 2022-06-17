import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:authentication_firebase/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

ThemeData createTheme() {
  final theme = ThemeData.from(colorScheme: createColorScheme());

  return theme.copyWith(
    dividerTheme: DividerThemeData(space: 0, color: AppColors.grey300),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
      contentTextStyle: TextStyle(
        color: Color(0xFF616161),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(fillColor: AppColors.greenMarineLight.withOpacity(0.24)),
  );
}
