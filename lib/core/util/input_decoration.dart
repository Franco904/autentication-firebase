import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration getFormFieldDecoration(String label) {
  final theme = Theme.of(Get.context!);
  final textTheme = theme.textTheme;

  return InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
        width: 1,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.38),
        width: 1,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.blackDisabled,
        width: 1,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.red900,
        width: 2,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.red900,
        width: 2,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
    ),
    labelText: label,
    errorText: null,
    errorStyle: textTheme.subtitle2?.copyWith(
      color: AppColors.red900,
    ),
    helperText: ' ',
    errorMaxLines: 2,
    filled: true,
  );
}
