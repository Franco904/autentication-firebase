import 'package:authentication_firebase/core/util/validations.dart';
import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:authentication_firebase/modules/authentication/authentication_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldAuth extends GetView<AuthenticationPageController> {
  const PasswordFieldAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: 'Senha',
      hasObscureText: true,
      maxLength: 20,
      validator: validatePassword,
      onChanged: onChanged,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      focusNode: controller.authPasswordFocusNode,
    );
  }

  void onChanged(String? password) {
    if (password == null || password.isEmpty) {
      controller.authPassword.value = '';
      return;
    }

    controller.authPassword.value = password;
  }
}
