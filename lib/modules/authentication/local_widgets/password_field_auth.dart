import 'package:authentication_firebase/core/util/validations.dart';
import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:authentication_firebase/modules/authentication/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldAuth extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: 'Senha',
      validator: validatePassword,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      focusNode: controller.authPasswordFocusNode,
    );
  }
}
